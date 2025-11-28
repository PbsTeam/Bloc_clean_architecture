import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../service_locator.dart';

class AppStorage {
  final storage = getIt.get<FlutterSecureStorage>();

  Future<void> save(String key, dynamic value) async {
    await storage.write(key: key, value: value);
  }

  Future<dynamic> get(String key) async {
    return await storage.read(
      key: key,
    );
  }

  Future<void> clearStorage() async {
    return await storage.deleteAll();
  }
}