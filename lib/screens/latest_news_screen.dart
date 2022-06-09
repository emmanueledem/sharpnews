import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharpnews/app/constants/colors.dart';
import 'package:sharpnews/app/widgets/all_latest_news.dart';
import 'package:sharpnews/app/widgets/search_bar.dart';
import 'package:sharpnews/core/navigators/routes.dart';
import 'package:sharpnews/core/utils/time_utils.dart';
import 'package:sharpnews/screens/screens.dart';
import 'package:sharpnews/view_models/news/news_view_model.dart';
import 'package:sharpnews/core/utils/string_utils.dart';

import '../model/news_model.dart';

class LatestNewsScreen extends StatefulWidget {
  const LatestNewsScreen({Key? key}) : super(key: key);

  @override
  State<LatestNewsScreen> createState() => _LatestNewsScreenState();
}

class _LatestNewsScreenState extends State<LatestNewsScreen> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, top: 49),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Latest News',
                      style: TextStyle(
                          fontSize: 32,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFFFFFF)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Latest updates around the world',
                      style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFFFFF)),
                    ),
                    SizedBox(
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
            _newsList!.isNotEmpty
                ? Expanded(
                    child: ListView(
                      children: _newsList
                          .map(
                            (e) => GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.readNews,
                                      arguments: ReadNewsScreenData(
                                        title: e.title,
                                        description: e.description,
                                        author: e.author,
                                        image: e.urlToImage,
                                        ago: TimeUtils.ago(DateTime.parse(
                                                e.publishedAt!)) +
                                            ' ago',
                                        content: e.content!,
                                      ));
                                },
                                child: AllLatestNews(
                                  image: e.urlToImage,
                                  title: e.title,
                                  description: e.description,
                                  time: TimeUtils.ago(
                                          DateTime.parse(e.publishedAt!)) +
                                      ' ago',
                                  source: e.source.name,
                                )),
                          )
                          .toList(),
                    ),
                  )
                : const Center(
                    child: Text('Keyword Not found'),
                  ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
