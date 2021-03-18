import 'package:flutter/material.dart';
import 'package:flutter_news/common/type/index.dart';
import 'package:flutter_news/common/utils/http.dart';

class UserApi {
  static Future<UserLoginRes> login({
    @required BuildContext context,
    UserLoginReq params,
  }) async {
    var res = await HttpUtil().post(
      '/user/login',
      context: context,
      params: params,
    );
    return UserLoginRes.fromJson(res);
  }
}
