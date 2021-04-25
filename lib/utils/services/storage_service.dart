import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static String accountId = 'accountId';

  static Future<SharedPreferences> storage = SharedPreferences.getInstance();

  static Future<bool> isLogged() async {
    String value = await storage.then((storage) => storage.getString(accountId) ?? '');
    return value != null && value.isNotEmpty;
  }
}
