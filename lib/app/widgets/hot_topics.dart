import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:sharpnews/app/constants/colors.dart';
import 'package:sharpnews/app/widgets/news_source_and_time.dart';
import 'package:sharpnews/core/utils/time_utils.dart';
import 'package:sharpnews/view_models/news/news_view_model.dart';

class HotTopics extends StatelessWidget {
  const HotTopics({
    Key? key,
    required this.newsProvider,
  }) : super(key: key);

  final NewsViewModel newsProvider;

  @override
  Widget build(BuildContext context) {
    Logger().d(newsProvider.newsData![0].urlToImage);
    return CachedNetworkImage(
      imageUrl: newsProvider.newsData![0].urlToImage.toString(),
      imageBuilder: (context, imageProvider) => Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsProvider.newsData![0].title!,
                  style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFF8F8F8)),
                ),
                const SizedBox(
                  height: 8,
                ),
                NewsSourceAndTime(
                  time: TimeUtils.ago(DateTime.parse(
                          newsProvider.newsData![0].publishedAt!)) +
                      ' ago',
                  source: newsProvider.newsData![0].source.name!,
                )
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        color: appbusyColor,
      )),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
    );
  }
}
