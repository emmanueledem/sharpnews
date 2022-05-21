import 'package:flutter/material.dart';
import 'package:sharpnews/constants/colors.dart';
import 'package:sharpnews/constants/images.dart';
import 'package:sharpnews/widgets/bottom_nav_container.dart';
import 'package:sharpnews/widgets/latest_news.dart';
import 'package:sharpnews/widgets/news_source_and_time.dart';
import '../constants/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 49, left: 43, right: 42),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Good Morning',
                        style: TextStyle(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Form(
                              child: TextFormField(
                                decoration: kinputdecorationStyle,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          const Image(
                              width: 32,
                              height: 32,
                              image: AssetImage('assets/app_icons/menu.png'))
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const Text(
                        'Hot Topics',
                        style: TextStyle(
                            fontSize: 36,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFFFFFF)),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 200,
                              width: 305,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                image: DecorationImage(
                                  image: AssetImage(Appset.appHotTopicsImage),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              image: AssetImage('assets/app_icons/Polygon.png'))
                        ],
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Row(
                        children: [
                          LatestNews(
                            title: 'News Title Lorem Ipsum Dolor Sit Amet',
                            image: Appset.appfighterImage,
                            source: 'CNN UK',
                            time: '1 Hour Ago',
                          ),
                          LatestNews(
                            title: 'News Title Lorem Ipsum Dolor Sit Amet',
                            image: Appset.appAthleteImage,
                            source: 'CNN UK',
                            time: '1 Hour Ago',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                left: 54,
                right: 55,
                top: 377,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Massa tortor nibh nulla condimentum imperdiet scelerisque...',
                      style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFF8F8F8)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    NewsSourceAndTime(
                      time: '2 HOURS Ago',
                      source: 'CNN UK',
                    )
                  ],
                )),
            Positioned(
                bottom: 32,
                left: 24,
                right: 24,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Container(
                    height: 56,
                    width: 342,
                    decoration: const BoxDecoration(
                        color: appbusyColor,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 39),
                      child: Bottom_nav_container(),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
