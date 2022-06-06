import 'package:flutter/material.dart';

class BottomNavContainer extends StatelessWidget {
  const BottomNavContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Image(
            width: 24,
            height: 32,
            image: AssetImage('assets/app_icons/home.png')),
        Image(
            width: 24,
            height: 24,
            image: AssetImage('assets/app_icons/trending_up.png')),
        Image(
            width: 24,
            height: 24,
            image: AssetImage('assets/app_icons/search_two.png')),
        Image(
            width: 24,
            height: 24,
            // color: Colors.black,
            image: AssetImage('assets/app_icons/bookmark.png')),
      ],
    );
  }
}
