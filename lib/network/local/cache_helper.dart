import 'package:flutter_keychain/flutter_keychain.dart';
class CacheHelper {

  static Future<void> putData({
    required String key,
    required dynamic value,
  }) async {
    return await FlutterKeychain.put(key: key, value: value);
  }

  static dynamic getData({
    required String key,
  }) async {
    return await FlutterKeychain.get(key: key);
  }
}
