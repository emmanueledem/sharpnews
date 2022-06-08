import 'package:flutter/material.dart';
import 'package:sharpnews/app/widgets/news_source_and_time.dart';
import 'package:sharpnews/screens/view_news.dart';

// ignore: must_be_immutable
class LatestNewsHome extends StatelessWidget {
  LatestNewsHome(
      {Key? key,
      required this.image,
      required this.title,
      required this.source,
      required this.time})
      : super(key: key);

  String image;
  String title;
  String source;
  String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Image(width: 143, height: 96, image: AssetImage(image)),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              color: Color(0xffFFFFFF)),
        ),
        const SizedBox(
          height: 16,
        ),
        NewsSourceAndTime(
          time: '2 HOURS Ago',
          source: 'CNN UK',
        )
      ],
    );
  }
}
