import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsSourceAndTime extends StatelessWidget {
  NewsSourceAndTime({Key? key, required this.source, required this.time})
      : super(key: key);
  String time;
  String source;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(time,
            style: const TextStyle(
                fontSize: 8,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: Color(0xFFF8F8F8))),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text(source,
              style: const TextStyle(
                  fontSize: 8,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFF8F8F8))),
        )
      ],
    );
  }
}
