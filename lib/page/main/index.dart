import 'package:flutter/material.dart';
import 'package:flutter_news/common/api/news.dart';
import 'package:flutter_news/common/type/news/res/getAllChannels.dart';
import 'package:flutter_news/common/type/news/res/getList.dart';
import 'package:flutter_news/common/utils/screen.dart';
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
  TypeGetListResponse _newsPageList;
  TypeGetSubjectResponse _subjectList;
  TypeGetAllChannelsResponse _newsChannels;
  String _curSelectCode;

  @override
  void initState() {
    super.initState();
    print('-----initState----');
    _loadAllData();
  }

  _loadAllData() async {
    _newsChannels = await NewsApi.getAllChannels();
    _subjectList = await NewsApi.getSubject('{"subject_id":6192}');
    _newsPageList = await NewsApi.getList(
        '{"channel_id":"3892","channel_type":"31","page":1,"page_size":10}');
    // _curSelectCod
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
            selectCategoryCode: 9,
            onTap: (item) {
              print(item);
            },
          );
  }

  // 推荐
  Widget _buildRecommend() {
    return this._newsPageList == null
        ? Container()
        : recommendWidget(this._newsPageList);
  }

  // 专题
  Widget _buildSubject() {
    return this._newsPageList == null
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
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildCategories(),
          Divider(height: 1),
          _buildRecommend(),
          Divider(height: 1),
          _buildSubject(),
          Divider(height: 1),
          _buildNewsList(),
          Divider(height: 1),
          _buildEmailSubscribe(),
        ],
      ),
    );
  }
}
