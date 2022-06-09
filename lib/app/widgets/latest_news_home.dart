import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sharpnews/app/widgets/news_source_and_time.dart';

// ignore: must_be_immutable
class LatestNewsHome extends StatelessWidget {
  LatestNewsHome(
      {Key? key,
      required this.image,
      required this.title,
      required this.source,
      required this.time})
      : super(key: key);

  String? image;
  String? title;
  String? source;
  String? time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            width: 143,
            height: 96,
            imageUrl: image.toString(),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          title!,
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
          time: time.toString(),
          source: source!,
        )
      ],
    );
  }
}
