import 'package:flutter/material.dart';
import '../../../config/components/app_storage.dart';
import '../../../config/routes/routes_names.dart';
import '../../../service_locator.dart';
import 'app_storage_keys.dart';

class LocalStorage {
  // Private constructor
  LocalStorage._privateConstructor();

  // The single instance
  static final LocalStorage _instance = LocalStorage._privateConstructor();

  // Public getter
  static LocalStorage get instance => _instance;

  static final storage = getIt.get<AppStorage>();

  bool isLogin = false;
  String userToken = '';

  Future<void> init() async {
    isLogin =
        await storage.get(AppStorageKeys.isLogin) == 'true' ? true : false;

    userToken = await storage.get(AppStorageKeys.token) ?? '';
  }

  Future<void> saveToken(String token) async {
    userToken = token;
    await storage.save(AppStorageKeys.token, token);
  }

  Future<void> saveUserLogin(String login) async {
    isLogin = login == 'true' ? true : false;

    await storage.save(AppStorageKeys.isLogin, login);
  }

  Future<void> clearAll(BuildContext context) async {
    await storage.clearStorage();
    await init();

    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.loginScreen,
        (route) => false,
      );
    }
  }
}
