import 'package:flutter/material.dart';
import '../constants/styles.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
