import 'package:flutter/material.dart';
import 'package:sharpnews/app/constants/colors.dart';
import 'package:sharpnews/app/constants/images.dart';
import 'package:sharpnews/view_models/splash/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _handleStartUp(context);
  }

  _handleStartUp(context) async {
    await SplashViewModel().checkNewtwork(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: appBackgroundColor,
      body: Center(child: Image(image: AssetImage(Appset.applogo))),
    );
  }
}
