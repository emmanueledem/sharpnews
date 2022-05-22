import 'package:flutter/material.dart';
import 'package:sharpnews/constants/images.dart';

class AllLatestNews extends StatelessWidget {
  const AllLatestNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: const [
                    Text(
                      'INDvENG Tests to be played in front of crowd',
                      style: TextStyle(
                          fontSize: 17,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffC4C4C4)),
                    ),
                    SizedBox(height: 9),
                    Text(
                        'The 5-Test series between India & England is set to be played in front of packed..',
                        style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffC4C4C4)))
                  ],
                ),
              ),
              const Image(image: AssetImage(Appset.cricketMan))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('Sport Biz',
                      style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffC4C4C4))),
                  SizedBox(
                    width: 19.36,
                  ),
                  Image(
                      width: 2.03,
                      height: 2,
                      color: Color(0xff2F9FF8),
                      image: AssetImage(Appset.ellipseImg)),
                  SizedBox(
                    width: 19.36,
                  ),
                  Text('7 hours ago',
                      style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffC4C4C4))),
                ],
              ),
              Row(
                children: const [
                  Image(
                      width: 16.26,
                      height: 16,
                      image: AssetImage('assets/app_icons/share.png')),
                  SizedBox(
                    width: 37.16,
                  ),
                  Image(
                      width: 16.26,
                      height: 16,
                      image: AssetImage('assets/app_icons/pocket.png')),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
