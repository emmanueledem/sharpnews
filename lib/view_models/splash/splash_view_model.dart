import 'package:flutter/material.dart';
import 'package:sharpnews/app/widgets/flushbar_notification.dart';
import 'package:sharpnews/core/networks/network_info.dart';
import 'package:sharpnews/screens/welcome_screen.dart';
import 'package:sharpnews/view_models/base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  final NetworkInfoImpl _connectivityInfo = NetworkInfoImpl();
  Future checkNewtwork({required BuildContext context}) async {
    Future.delayed(const Duration(seconds: 3), () async {
      setBusy(true);
      if (await _connectivityInfo.isConnected) {
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const IntroScreen(),
          ),
        );
      } else {
        FlushBarNotification.showError(
            context, 'No internet connection detected.', 'Network error');
      }
      setBusy(false);
    });
  }
}
