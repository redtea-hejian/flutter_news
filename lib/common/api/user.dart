import 'package:flutter_news/common/type/index.dart';
import 'package:flutter_news/common/utils/http.dart';

class UserApi {
  static Future<UserLoginRes> login({UserLoginReq params}) async {
    var res = await HttpUtil().post('/user/login', params: params);
    return UserLoginRes.fromJson(res);
  }
}
