import 'package:flutter/material.dart';
import 'package:sharpnews/constants/colors.dart';
import 'package:sharpnews/constants/images.dart';
import 'package:sharpnews/constants/styles.dart';

class ViewNews extends StatefulWidget {
  const ViewNews({Key? key}) : super(key: key);

  @override
  State<ViewNews> createState() => _ViewNewsState();
}

class _ViewNewsState extends State<ViewNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBackgroundColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Image(
              image: AssetImage('assets/app_icons/arrow_left_circle_fill.png')),
        ),
        title: const Text(
          'News',
          style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: Color(0xffC4C4C4)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 33, left: 29),
              child: Text(
                'INDvENG Tests to be played in front of crowd',
                style: TextStyle(
                    fontSize: 28,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffC4C4C4)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 5),
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 65, 5, 8),
                          borderRadius: BorderRadius.circular(6)),
                      height: 22,
                      width: 48,
                      child: const Center(
                        child: Text(
                          'Tech',
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 238, 0, 12),
                          ),
                        ),
                      )),
                  const SizedBox(
                    width: 9,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 65, 5, 8),
                          borderRadius: BorderRadius.circular(6)),
                      height: 22,
                      width: 48,
                      child: const Center(
                        child: Text(
                          'Mobile',
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 238, 0, 12),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                right: 33,
                top: 26,
                left: 32,
              ),
              child: Text(
                'Samsung\'s next Unpacked event reportedly lands August 11',
                style: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFFFFFF)),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 30, left: 31),
              child: Image(image: AssetImage(Appset.athletesImg)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 43, left: 20, top: 46),
              child: Text(
                'The 5-Test series between India & England is set to be played in front of packed..The 5-Test series between India & England is set to be played in front of packed..The 5-Test series between India & England is set to be played in front of packed..The 5-Test series between India & England is set to be played in front of packed..The 5-Test series between India & England is set to be played in front of packed..The 5-Test series between India & England is set to be played in front of packed..',
                style: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffFFFFFF).withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 98, left: 99, top: 48),
              child: Text(
                'Published July 5, 2021 - 8:16 pm IST',
                style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffFFFFFF).withOpacity(0.3)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 148, left: 148, top: 4),
              child: Text(
                'by John Abraham',
                style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFFFFFF)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 148, left: 148, top: 15),
              child: Text('Back To Top',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffB10009),
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 31, left: 32, top: 48),
                child: Row(
                  children: const [
                    Text('Add your comment',
                        style: TextStyle(
                          fontSize: 17,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFFFFFF),
                        )),
                    SizedBox(
                      width: 13,
                    ),
                    SizedBox(
                      width: 168,
                      child: Divider(
                        thickness: 1,
                        height: 1,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    SizedBox(height: 21)
                  ],
                )),
            Form(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 26, left: 37, top: 12),
                  child: TextFormField(
                    maxLines: 5,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'poppins',
                        height: 1.3),
                    decoration: kAddcomentInputDecorationStyle.copyWith(
                      labelText: 'Enter your comment here',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 31, right: 190, top: 9),
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0XFFB10009)),
                      ),
                      onPressed: null,
                      child: const Text(
                        'Post a comment',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      )),
                ),
              ],
            )),
            const SizedBox(
              height: 21,
            )
          ],
        ),
      ),
    );
  }
}
