import 'package:flutter/material.dart';
import 'package:sharpnews/app/constants/colors.dart';
import 'package:sharpnews/app/widgets/all_latest_news.dart';
import 'package:sharpnews/app/widgets/search_bar.dart';
import 'package:sharpnews/screens/view_news.dart';

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 150, top: 49),
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
              ],
            ),
          ),
          const SearchBar(),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 23, right: 24),
            child: Row(
              children: [
                Expanded(
                    child: ListView(
                  shrinkWrap: true,
                  children: [
                    InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const ViewNews()));
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
