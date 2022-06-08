import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sharpnews/app/widgets/news_source_and_time.dart';
import 'package:sharpnews/core/utils/time_utils.dart';
import 'package:sharpnews/view_models/news/news_view_model.dart';

class HotTopics extends StatelessWidget {
  const HotTopics({
    Key? key,
    required this.newsProvider,
  }) : super(key: key);

  final NewsViewModel newsProvider;

    // CachedNetworkImage(
    //                     imageUrl: image.toString(),
    //                     progressIndicatorBuilder:
    //                         (context, url, downloadProgress) =>
    //                             CircularProgressIndicator(
    //                                 value: downloadProgress.progress),
    //                     errorWidget: (context, url, error) =>
    //                         const Icon(Icons.error),
    //                   ),

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:
          MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // image: DecorationImage(
          
        //   image: 
          
        //   // NetworkImage(
        //   //   newsProvider.newsData![1].urlToImage!,
        //   // ),
        // ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                        newsProvider.newsData![0]
                            .publishedAt!)) +
                    ' ago',
                source: newsProvider
                    .newsData![0].source.name!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
