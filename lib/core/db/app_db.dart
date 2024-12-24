import 'package:hive/hive.dart';

import '../../data/model/response/user_profile_response.dart';
import '../locator/locator.dart';

class AppDB {
  static const _appDbBox = '_appDbBox';
  static const fcmKey = 'fcm_key';
  static const platform = 'platform';
  final Box<dynamic> _box;

  AppDB._(this._box);

  static Future<AppDB> getInstance() async {
    final box = await Hive.openBox<dynamic>(_appDbBox);
    return AppDB._(box);
  }

  T getValue<T>(String key, {T? defaultValue}) =>
      _box.get(key, defaultValue: defaultValue) as T;

  Future<void> setValue<T>(String key, T value) => _box.put(key, value);

  bool get firstTime => getValue("firstTime", defaultValue: false);

  set firstTime(bool update) => setValue("firstTime", update);

  bool get isLogin => getValue("isLogin", defaultValue: false);

  set isLogin(bool update) => setValue("isLogin", update);

  String get token => getValue("token", defaultValue: "");

  set token(String update) => setValue("token", update);

  String get fcmToken => getValue("fcm_token", defaultValue: "0");

  set fcmToken(String update) => setValue("fcm_token", update);

  int get cartCount => getValue("cart_count", defaultValue: 0);

  set cartCount(int update) => setValue("cart_count", update);

  String get apiKey => getValue("apiKey", defaultValue: "TEST123");

  set apiKey(String update) => setValue("apiKey", update);

  UserData get user => getValue("user");

  set user(UserData user) => setValue("user", user);

  void logout() {
    token = "";
    isLogin = false;
    firstTime = true;
  }
}

final appDB = locator<AppDB>();
