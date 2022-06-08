import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:sharpnews/app/constants/colors.dart';
import 'package:sharpnews/app/constants/images.dart';
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
                      const SearchBar(),
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
                                        title: newsProvider.newsData![1].title!,
                                        description: newsProvider.newsData![1].description!,
                                        author: newsProvider.newsData![1].author!,
                                        image: newsProvider.newsData![1].urlToImage!,
                                        ago: DateTime.parse(newsProvider.newsData![1].publishedAt!),
                                        content: newsProvider.newsData![1].content!,));
                              },
                              child: HotTopics(newsProvider: newsProvider),
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
                              child: StaggeredGrid.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                children: [
                                  LatestNewsHome(
                                    title:
                                        'News Title Lorem Ipsum Dolor Sit Amet',
                                    image: Appset.appfighterImage,
                                    source: 'CNN UK',
                                    time: '1 Hour Ago',
                                  ),
                                  LatestNewsHome(
                                    title:
                                        'News Title Lorem Ipsum Dolor Sit Amet',
                                    image: Appset.appAthleteImage,
                                    source: 'CNN UK',
                                    time: '1 Hour Ago',
                                  ),
                                  const SizedBox(
                                    height: 100,
                                  )
                                ],
                              ),
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
