import 'package:flutter_news/common/type/news/res/getAllChannels.dart';
import 'package:flutter_news/common/type/news/res/getDetail.dart';
import 'package:flutter_news/common/type/news/res/getHotNews.dart';
import 'package:flutter_news/common/type/news/res/getList.dart';
import 'package:flutter_news/common/type/news/res/getListAdv.dart';
import 'package:flutter_news/common/type/news/res/getReplyList.dart';
import 'package:flutter_news/common/type/news/res/getWapRelatedNews.dart';
import 'package:flutter_news/common/type/news/res/getSubject.dart';
import 'package:flutter_news/common/utils/http.dart';

class NewsApi {
  static Future<TypeGetAllChannelsResponse> getAllChannels() async {
    var res = await HttpUtil().get('/getAllChannels');
    return TypeGetAllChannelsResponse.fromJson(res);
  }

  static Future<TypeGetDetailResponse> getDetail(String params) async {
    var res = await HttpUtil().post('/getDetail', params: params);
    return TypeGetDetailResponse.fromJson(res);
  }

  static Future<TypeGetHotNewsResponse> getHotNews() async {
    var res = await HttpUtil().get('/getHotNews');
    return TypeGetHotNewsResponse.fromJson(res);
  }

  static Future<TypeGetListResponse> getList(String params) async {
    var res = await HttpUtil().post('/getList', params: params);
    return TypeGetListResponse.fromJson(res);
  }

  static Future<TypeGetListAdvResponse> getListAdv(String params) async {
    var res = await HttpUtil().post('/getListAdv', params: params);
    return TypeGetListAdvResponse.fromJson(res);
  }

  static Future<TypeGetReplyListResponse> getReplyList(String params) async {
    var res = await HttpUtil().post('/getReplyList', params: params);
    return TypeGetReplyListResponse.fromJson(res);
  }

  static Future<TypeGetWapRelatedNewsResponse> getWapRelatedNews(
      String params) async {
    var res = await HttpUtil().post('/getWapRelatedNews', params: params);
    return TypeGetWapRelatedNewsResponse.fromJson(res);
  }

  static Future<TypeGetSubjectResponse> getSubject(String params) async {
    var res = await HttpUtil().post('/getSubjectInfo', params: params);
    return TypeGetSubjectResponse.fromJson(res);
  }
}
