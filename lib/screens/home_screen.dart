import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sharpnews/app/constants/colors.dart';
import 'package:sharpnews/core/utils/time_utils.dart';
import 'package:sharpnews/app/widgets/hot_topics.dart';
import 'package:sharpnews/app/widgets/latest_news_home.dart';
import 'package:sharpnews/app/widgets/search_bar.dart';
import 'package:sharpnews/core/navigators/routes.dart';
import 'package:sharpnews/core/utils/string_utils.dart';
import 'package:sharpnews/model/news_model.dart';
import 'package:sharpnews/core/utils/greetings.dart';
import 'package:sharpnews/screens/view_news.dart';
import 'package:sharpnews/view_models/news/news_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  String _searchText = '';

  @override
  void initState() {
    _searchText = _searchController.text.trim();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.trim();
      });
    });
    super.initState();
    _handleNews();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future _handleNews() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<NewsViewModel>(context, listen: false).init();
    });
  }

    

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsViewModel>(context);
    final List<NewsModel>? _newsList = _searchText.isEmpty
        ? newsProvider.newsData
        : newsProvider.newsData!
            .where((item) => item.title!.contains(
                  RegExp(
                    StringUtil.escapeSpecial(_searchText),
                    caseSensitive: false,
                  ),
                ))
            .toList();
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: SafeArea(
        child: newsProvider.newsData == null
            ? const Center(
                child: CircularProgressIndicator(
                color: appbusyColor,
              ))
            : Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              right: 24, left: 24, top: 49),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Good ' + TimeFmt.greeting(),
                                style: const TextStyle(
                                    fontSize: 32,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFFFFFF)),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Explore the world by one Tap',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffFFFFFF)),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                            ],
                          )),
                       SearchBar(
                        searchController: _searchController,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: 42, right: 43, top: 16),
                              child: Text(
                                'Hot Topics',
                                style: TextStyle(
                                    fontSize: 36,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFFFFFF)),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, RouteName.readNews,
                                    arguments: ReadNewsScreenData(
                                      title: newsProvider.newsData![0].title!,
                                      description: newsProvider
                                          .newsData![0].description!,
                                      author: newsProvider.newsData![0].author!,
                                      image:
                                          newsProvider.newsData![0].urlToImage!,
                                      ago: TimeUtils.ago(DateTime.parse(
                                              newsProvider
                                                  .newsData![0].publishedAt!)) +
                                          ' ago',
                                      content:
                                          newsProvider.newsData![0].content!,
                                    ));
                              },
                              child: Hero(tag: "newsImage", child: HotTopics(newsProvider: newsProvider)),
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 43, left: 43),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Latest News',
                                    style: TextStyle(
                                        fontSize: 36,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffFFFFFF)),
                                  ),
                                  Image(
                                      width: 32,
                                      height: 32,
                                      image: AssetImage(
                                          'assets/app_icons/Polygon.png')),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 42, left: 42),
                              child: _newsList!.isNotEmpty
                                  ? StaggeredGrid.count(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20,
                                      children: _newsList
                                          .map<Widget>((e) => GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(context,
                                                      RouteName.readNews,
                                                      arguments:
                                                          ReadNewsScreenData(
                                                        title: e.title,
                                                        description:
                                                            e.description,
                                                        author: e.author,
                                                        image: e.urlToImage,
                                                        ago: TimeUtils.ago(
                                                                DateTime.parse(e
                                                                    .publishedAt!)) +
                                                            ' ago',
                                                        content: e.content!,
                                                      ));
                                                },
                                                child: LatestNewsHome(
                                                  title: e.title!,
                                                  image: e.urlToImage,
                                                  source: e.source.name!,
                                                  time:  TimeUtils.ago(
                                                                DateTime.parse(e
                                                                    .publishedAt!)) +
                                                            ' ago',
                                                ),
                                              ))
                                          .toList(),
                                    )
                                  : const Center(
                                      child: Text('No News Found'),
                                    ),
                            ),
                            const SizedBox(
                              height: 100,
                            )
                          ]))),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
