import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_news/common/api/news.dart';
import 'package:flutter_news/common/type/news/res/getAllChannels.dart';
import 'package:flutter_news/common/type/news/res/getHotNews.dart';
import 'package:flutter_news/common/type/news/res/getList.dart';
import 'package:flutter_news/common/utils/date.dart';
import 'package:flutter_news/common/utils/index.dart';
import 'package:flutter_news/common/utils/screen.dart';
import 'package:flutter_news/common/values/index.dart';
import 'package:flutter_news/common/widgets/index.dart';
import 'package:flutter_news/page/main/categories_widget.dart';
import 'package:flutter_news/page/main/recommend_widget.dart';
import 'package:flutter_news/page/main/subject_widget.dart';
import 'package:flutter_news/page/main/news_widget.dart';
import 'package:flutter_news/page/main/newsletters_widget.dart';
import 'package:flutter_news/common/type/news/res/getSubject.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  EasyRefreshController _controller;
  TypeGetHotNewsResponse _hotNewsList;
  TypeGetListResponse _newsPageList;
  TypeGetSubjectResponse _subjectList;
  TypeGetAllChannelsResponse _newsChannels;
  int _curSelectCode = 9;
  int _channelType = 1;

  @override
  void initState() {
    super.initState();
    print('-----initState----');
    _controller = EasyRefreshController();
    _loadAllData();
    _loadLatestWithDiskCache();
  }

  _loadLatestWithDiskCache() {
    if (CACHE_ENABLE == true) {
      var cacheData = StorageUtil().getJSON(STORAGE_INDEX_NEWS_CACHE_KEY);
      if (cacheData != null) {
        Timer(Duration(seconds: 3), () {
          _controller.callRefresh();
        });
      }
    }
  }

  _loadAllData() async {
    _hotNewsList = await NewsApi.getHotNews(context: context, cacheDisk: true);
    _newsChannels =
        await NewsApi.getAllChannels(context: context, cacheDisk: true);
    _subjectList = await NewsApi.getSubject(
      context: context,
      params: '{"subject_id":6192}',
      cacheDisk: true,
    );
    _newsPageList = await NewsApi.getList(
      context: context,
      params:
          '{"channel_id":"$_curSelectCode","channel_type":"$_channelType","page":1,"page_size":10}',
      cacheDisk: true,
    );
    // _curSelectCod
    if (mounted) {
      setState(() {});
    }
  }

  _loadNewsData(
    int categorycode,
    int channelType, {
    bool refresh = false,
  }) async {
    _curSelectCode = categorycode;
    _channelType = channelType;
    _hotNewsList = await NewsApi.getHotNews(context: context, cacheDisk: true);

    _subjectList = await NewsApi.getSubject(
      context: context,
      params: '{"subject_id":6192}',
      cacheDisk: true,
    );
    _newsPageList = await NewsApi.getList(
      context: context,
      params:
          '{"channel_id":"$categorycode","channel_type":"$channelType","page":1,"page_size":10}',
      cacheDisk: true,
    );
    if (mounted) {
      setState(() {});
    }
  }

  // 分类
  Widget _buildCategories() {
    return this._newsChannels == null
        ? Container()
        : newsCategoriesWidget(
            categories: this._newsChannels,
            selectCategoryCode: _curSelectCode,
            onTap: (item) {
              _loadNewsData(item['channel_id'], item['type']);
            },
          );
  }

  // 推荐
  Widget _buildRecommend() {
    if (_curSelectCode == 9 && this._channelType == 1) {
      return this._hotNewsList == null
          ? Container()
          : recommendWidget(this._hotNewsList);
    } else {
      return this._newsPageList == null
          ? Container()
          : bannerWidget(this._newsPageList);
    }
  }

  // 专题
  Widget _buildSubject() {
    return this._subjectList == null
        ? Container()
        : subjectWidget(this._subjectList);
  }

  // 新闻
  Widget _buildNewsList() {
    return _newsPageList == null
        ? Container(height: duSetHeight(161 * 5 + 100.0))
        : newsWidget(this._newsPageList);
  }

  // 订阅
  Widget _buildEmailSubscribe() {
    return newsLettersWidget();
  }

  @override
  Widget build(BuildContext context) {
    return _newsPageList == null
        ? cardListSkeleton()
        : EasyRefresh(
            enableControlFinishRefresh: true,
            controller: _controller,
            header: ClassicalHeader(
              infoColor: AppColors.primaryElement,
              infoText: 'Update at ${duTimeLineFormat2(DateTime.now())}',
            ),
            onRefresh: () async {
              await _loadNewsData(_curSelectCode, _channelType, refresh: true);
              _controller.finishRefresh();
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildCategories(),
                  Container(
                    child: Divider(height: 1),
                  ),
                  _buildRecommend(),
                  Container(
                    margin: EdgeInsets.only(bottom: duSetHeight(10)),
                    child: Divider(height: 1),
                  ),
                  _buildSubject(),
                  Container(
                    margin: EdgeInsets.only(top: duSetHeight(10)),
                    child: Divider(height: 1),
                  ),
                  _buildNewsList(),
                  Container(
                    margin: EdgeInsets.only(top: duSetHeight(10)),
                    child: Divider(height: 1),
                  ),
                  _buildEmailSubscribe(),
                ],
              ),
            ),
          );
  }
}
