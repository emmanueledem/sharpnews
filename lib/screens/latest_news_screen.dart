import 'package:flutter/material.dart';
import 'package:sharpnews/constants/colors.dart';
import 'package:sharpnews/constants/styles.dart';
import 'package:sharpnews/screens/view_news.dart';
import 'package:sharpnews/widgets/all_latest_news.dart';
import 'package:sharpnews/widgets/bottom_nav_container.dart';

class LatestNewsScreen extends StatefulWidget {
  const LatestNewsScreen({Key? key}) : super(key: key);

  @override
  State<LatestNewsScreen> createState() => _LatestNewsScreenState();
}

class _LatestNewsScreenState extends State<LatestNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 49, left: 43, right: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Latest News',
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
                  'Latest updates around the world',
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
                  height: 20,
                ),
                Expanded(
                    child: ListView(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ViewNews()));
                        },
                        child: const AllLatestNews()),
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
