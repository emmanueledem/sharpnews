import 'package:flutter/material.dart';
import 'package:sharpnews/constants/colors.dart';
import 'package:sharpnews/constants/images.dart';
import 'package:sharpnews/screens/latest_news_screen.dart';
import 'package:sharpnews/widgets/bottom_nav_container.dart';
import 'package:sharpnews/widgets/latest_news_home.dart';
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
                        const EdgeInsets.only(right: 143, left: 24, top: 49),
                    child: Column(
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
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Row(
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
                  ),
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
                  Padding(
                    padding: const EdgeInsets.only(right: 42, left: 42),
                    child: Row(
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
                  left: 70,
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
