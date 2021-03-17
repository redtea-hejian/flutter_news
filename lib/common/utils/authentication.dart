import 'package:flutter/cupertino.dart';
import 'package:flutter_news/common/utils/index.dart';
import 'package:flutter_news/common/values/index.dart';
import 'package:flutter_news/global.dart';

Future<bool> isAuthenticated() async {
  var profileJson = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
  return profileJson != null ? true : false;
}

Future deleteAuthentication() async {
  await StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
  Global.profile = null;
}

Future goLoginPage(BuildContext context) async {
  await deleteAuthentication();
  Navigator.pushNamedAndRemoveUntil(
      context, '/sign-in', (Route<dynamic> route) => false);
}
