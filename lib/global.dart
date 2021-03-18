import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news/common/type/index.dart';
import 'package:flutter_news/common/utils/index.dart';
import 'package:flutter_news/common/values/index.dart';
import 'package:flutter_news/common/provider/index.dart';

class Global {
  // 用户信息
  static UserLoginRes profile = UserLoginRes(accessToken: null);
  // 是否第一次登陆
  static bool isFirstOpen = false;
  // 是否离线登陆
  static bool isOfflineLogin = false;
  // 应用状态
  static AppState appState = AppState();
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
  static Future init() async {
    // 延缓加载一会
    WidgetsFlutterBinding.ensureInitialized();
    // 工具初始
    await StorageUtil.init();
    HttpUtil();
    // 读取设备第一次打开
    isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }
    // 读取离线用户信息
    var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    if (_profileJSON != null) {
      profile = UserLoginRes.fromJson(_profileJSON);
      isOfflineLogin = true;
    }
    //  android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  // 持久化用户信息
  static Future<bool> saveProfile(UserLoginRes userRes) {
    profile = userRes;
    return StorageUtil().setJSON(STORAGE_USER_PROFILE_KEY, userRes.toJson());
  }
}
