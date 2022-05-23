import 'package:flutter/material.dart';
import 'package:sharpnews/screens/view_news.dart';
import 'package:sharpnews/widgets/news_source_and_time.dart';

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
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ViewNews()));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
      ),
    );
  }
}
