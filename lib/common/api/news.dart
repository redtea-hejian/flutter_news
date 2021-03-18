import 'package:flutter/material.dart';
import 'package:flutter_news/common/type/news/res/getAllChannels.dart';
import 'package:flutter_news/common/type/news/res/getDetail.dart';
import 'package:flutter_news/common/type/news/res/getHotNews.dart';
import 'package:flutter_news/common/type/news/res/getList.dart';
import 'package:flutter_news/common/type/news/res/getListAdv.dart';
import 'package:flutter_news/common/type/news/res/getReplyList.dart';
import 'package:flutter_news/common/type/news/res/getWapRelatedNews.dart';
import 'package:flutter_news/common/type/news/res/getSubject.dart';
import 'package:flutter_news/common/utils/http.dart';
import 'package:flutter_news/common/values/index.dart';

class NewsApi {
  static Future<TypeGetAllChannelsResponse> getAllChannels({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var res = await HttpUtil().get(
      '/getAllChannels',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
      cacheKey: STORAGE_INDEX_NEWS_CACHE_KEY + 'channels',
    );
    return TypeGetAllChannelsResponse.fromJson(res);
  }

  static Future<TypeGetHotNewsResponse> getHotNews({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var res = await HttpUtil().get(
      '/getHotNews',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
      cacheKey: STORAGE_INDEX_NEWS_CACHE_KEY,
    );
    return TypeGetHotNewsResponse.fromJson(res);
  }

  static Future<TypeGetDetailResponse> getDetail({
    @required BuildContext context,
    String params,
  }) async {
    var res = await HttpUtil().post(
      '/getDetail',
      context: context,
      params: params,
    );
    return TypeGetDetailResponse.fromJson(res);
  }

  static Future<TypeGetListResponse> getList({
    @required BuildContext context,
    String params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var res = await HttpUtil().post(
      '/getList',
      context: context,
      params: params,
      cacheDisk: cacheDisk,
      cacheKey: STORAGE_INDEX_NEWS_CACHE_KEY + 'getList',
    );
    return TypeGetListResponse.fromJson(res);
  }

  static Future<TypeGetListAdvResponse> getListAdv({
    @required BuildContext context,
    String params,
  }) async {
    var res = await HttpUtil().post(
      '/getListAdv',
      context: context,
      params: params,
    );
    return TypeGetListAdvResponse.fromJson(res);
  }

  static Future<TypeGetReplyListResponse> getReplyList({
    @required BuildContext context,
    String params,
  }) async {
    var res = await HttpUtil().post(
      '/getReplyList',
      context: context,
      params: params,
    );
    return TypeGetReplyListResponse.fromJson(res);
  }

  static Future<TypeGetWapRelatedNewsResponse> getWapRelatedNews({
    @required BuildContext context,
    String params,
  }) async {
    var res = await HttpUtil().post(
      '/getWapRelatedNews',
      context: context,
      params: params,
    );
    return TypeGetWapRelatedNewsResponse.fromJson(res);
  }

  static Future<TypeGetSubjectResponse> getSubject({
    @required BuildContext context,
    String params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var res = await HttpUtil().post(
      '/getSubjectInfo',
      context: context,
      params: params,
      cacheDisk: cacheDisk,
      cacheKey: STORAGE_INDEX_NEWS_CACHE_KEY + 'getSubject',
    );
    return TypeGetSubjectResponse.fromJson(res);
  }
}
