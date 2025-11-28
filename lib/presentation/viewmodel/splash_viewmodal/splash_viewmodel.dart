import 'dart:async';
import 'package:bloc_clean_architecture/core/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';

import '../../../config/routes/routes_names.dart';

class SplashViewModel {
  isLogin(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      LocalStorage.instance.isLogin
          ? Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.homeScreen,
              (route) => false,
            )
          : Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.loginScreen,
              (route) => false,
            );
    });
  }
}
