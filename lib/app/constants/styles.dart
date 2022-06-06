import 'package:flutter/material.dart';
import 'package:sharpnews/app/constants/colors.dart';

const kinputdecorationStyle = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(
    color: appbusyColor,
    fontFamily: 'poppins',
    fontSize: 15,
  ),
  hintText: 'Search News',
  suffixIcon: Image(
      height: 24,
      width: 24,
      image: AssetImage('assets/app_icons/search_one.png')),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: appBackgroundColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
  ),
);

const kAddcomentInputDecorationStyle = InputDecoration(
  fillColor: Colors.white,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(13.0)),
  ),
  labelStyle: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.grey,
    fontFamily: 'poppins',
    fontSize: 16,
  ),
);
