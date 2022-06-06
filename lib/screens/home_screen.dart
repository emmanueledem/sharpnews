import 'package:flutter/material.dart';
import 'package:sharpnews/app/constants/colors.dart';
import 'package:sharpnews/app/constants/images.dart';
import 'package:sharpnews/app/widgets/latest_news_home.dart';
import 'package:sharpnews/app/widgets/news_source_and_time.dart';
import 'package:sharpnews/app/widgets/search_bar.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 24, left: 24, top: 49),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Good Morning',
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
                          'Explore the world by one Tap',
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
                    ),
                  ),
                  const SearchBar(),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 42, right: 43, top: 16),
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
                  Row(
                    children: const [
                      Expanded(
                        child: Image(
                            height: 200,
                            width: 305,
                            image: AssetImage(Appset.appHotTopicsImage)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 43, left: 43),
                    child: Row(
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
                            image: AssetImage('assets/app_icons/Polygon.png')),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 42, left: 42),
                    child: Row(
                      children: [
                        LatestNewsHome(
                          title: 'News Title Lorem Ipsum Dolor Sit Amet',
                          image: Appset.appfighterImage,
                          source: 'CNN UK',
                          time: '1 Hour Ago',
                        ),
                        LatestNewsHome(
                          title: 'News Title Lorem Ipsum Dolor Sit Amet',
                          image: Appset.appAthleteImage,
                          source: 'CNN UK',
                          time: '1 Hour Ago',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
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
            ],
          ),
        ),
      ),
    );
  }
}
