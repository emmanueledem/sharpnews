import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sharpnews/app/constants/styles.dart';
import 'package:sharpnews/app/constants/colors.dart';

class ViewNews extends StatefulWidget {
  const ViewNews({Key? key, required this.params}) : super(key: key);
  final ReadNewsScreenData params;
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
            Padding(
              padding: const EdgeInsets.only(right: 33, left: 29),
              child: Text(
                widget.params.title.toString(),
                style: const TextStyle(
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
            Padding(
              padding: const EdgeInsets.only(
                right: 33,
                top: 26,
                left: 32,
              ),
              child: Text(
                widget.params.description.toString(),
                style: const TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFFFFFF)),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 31),
              child: widget.params.title != null
                  ? Hero(
                      tag: 'newsImage',
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        imageUrl: widget.params.image.toString(),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress)),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    )
                  : const Text(''),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 43, left: 20, top: 46),
              child: Text(
                widget.params.content.toString(),
                style: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffFFFFFF).withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Text(
                widget.params.ago.toString(),
                style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffFFFFFF).withOpacity(0.3)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                widget.params.author.toString(),
                style: const TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFFFFFF)),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text('Back To Top',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB10009),
                    )),
              ),
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
                    Expanded(
                      child: SizedBox(
                        width: 168,
                        child: Divider(
                          thickness: 1,
                          height: 1,
                          color: Color(0xffFFFFFF),
                        ),
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

class ReadNewsScreenData {
  ReadNewsScreenData(
      {required this.title,
      required this.description,
      required this.author,
      required this.image,
      required this.ago,
      required this.content});

  final String? title;
  final String? description;
  final String? author;
  final String? image;
  final String? ago;
  final String? content;
}
