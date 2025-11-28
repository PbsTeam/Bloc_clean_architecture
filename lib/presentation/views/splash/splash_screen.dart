import 'dart:developer';
import 'package:flutter/material.dart';

import '../../../core/constants/image_constants.dart';
import '../../viewmodel/splash_viewmodal/splash_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashViewModel splashService = SplashViewModel();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      splashService.isLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              ImageConstants.possibilityLogo,
              width: size.width * 0.9,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
