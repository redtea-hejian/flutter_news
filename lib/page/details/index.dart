import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_news/common/api/news.dart';
import 'package:flutter_news/common/provider/index.dart';
import 'package:flutter_news/common/type/news/res/getDetail.dart';
import 'package:flutter_news/common/utils/date.dart';
import 'package:flutter_news/common/utils/index.dart';
import 'package:flutter_news/common/values/index.dart';
import 'package:flutter_news/common/widgets/app.dart';
import 'package:flutter_news/common/widgets/image.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  final String newsId;
  const DetailPage({this.newsId = ''});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  TypeGetDetailResponse _detailsPage;
  bool _isPageFinished = false;
  AppState appState;
  double _webviewHeight = 200;
  @override
  void initState() {
    super.initState();
    print('detail init');
    _loadAllData();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  _loadAllData() async {
    _detailsPage = await NewsApi.getDetail(
      context: context,
      params:
          '{"news_id":"${widget.newsId}","diversion_id":"","expireTimestampSign":""}',
    );
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildAppBar() {
    return transparentAppBar(
      context: context,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: AppColors.primaryText,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.bookmark_border),
          color: AppColors.primaryText,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.share),
          color: AppColors.primaryText,
          onPressed: () {
            // Share.share('check out my website https://example.com');
          },
        ),
      ],
    );
  }

  Widget _buildPageHeader(item) {
    dynamic happenTime = item['happen_time'] == null
        ? ''
        : DateTime.fromMillisecondsSinceEpoch(item['happen_time']);
    return Container(
      margin: EdgeInsets.all(duSetWidth(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 图
          imageCached(
            url: item['img_url'],
            width: duSetWidth(335),
            height: duSetHeight(290),
          ),
          // 标题
          Container(
            margin: EdgeInsets.only(top: duSetHeight(10)),
            child: Text(
              item['news_title'] == null
                  ? item['subject_title']
                  : item['news_title'],
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: AppColors.primaryText,
                fontSize: duSetFontSize(24),
                height: 1.5,
              ),
            ),
          ),
          // 一行 3 列
          Container(
            margin: EdgeInsets.only(top: duSetHeight(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // 分类
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 120,
                  ),
                  child: Text(
                    item['review_count'].toString(),
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: AppColors.secondaryElementText,
                      fontSize: duSetFontSize(14),
                      height: 1,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ),
                // 添加时间
                Container(
                  width: duSetWidth(15),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 120,
                  ),
                  child: Text(
                    '• ${happenTime != '' ? duTimeLineFormat(happenTime) : ''}',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.normal,
                      color: AppColors.thirdElementText,
                      fontSize: duSetFontSize(14),
                      height: 1,
                    ),
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWebView(item) {
    String url =
        'https://m.thecover.cn/news_details.html?id=${item['news_id']}&channelId=${appState.curSelectCode}';
    return Container(
      height: _webviewHeight,
      child: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) async {
          _controller.complete(webViewController);
        },
        // 用于获取js回调
        javascriptChannels:
            <JavascriptChannel>[_invokeJavascriptChannel(context)].toSet(),
        // 组织网页点击事件
        navigationDelegate: (NavigationRequest request) {
          // if (request.url != url) {
          return NavigationDecision.prevent;
          // }
          // return NavigationDecision.navigate;
        },
        // 页面开始，可以移除页面不需要的元素
        onPageStarted: (String url) {
          print(url);
        },
        onPageFinished: (String url) {
          _removeAd();
          _getWebViewHeight();
          setState(() {
            _isPageFinished = true;
          });
        },
        gestureNavigationEnabled: true,
      ),
    );
  }

  Widget _buildHtmlView() {
    if (_detailsPage != null) {
      String content = _detailsPage.toJson()['data']['content'];
      String videoUrl = _detailsPage.toJson()['data']['video_url'];
      print(videoUrl);
      var document = parse(content);

      // print(object)
      return Container(
        margin: EdgeInsets.only(top: duSetHeight(10)),
        padding: EdgeInsets.symmetric(horizontal: duSetWidth(10)),
        child: Text(
          document.body.text,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            color: AppColors.primaryText,
            fontSize: duSetFontSize(16),
            height: 1.3,
          ),
        ),
      );
    } else {
      return Center(
        child: Text('Loading...'),
      );
    }
  }

  // 注册js回调
  JavascriptChannel _invokeJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Invoke',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
        var webHeight = double.parse(message.message);
        if (webHeight != null) {
          setState(() {
            _webviewHeight = webHeight;
          });
        }
      },
    );
  }

  // 获取页面高度
  _getWebViewHeight() async {
    await (await _controller.future)?.evaluateJavascript('''
      try {
          // Invoke.postMessage([document.body.clientHeight,document.documentElement.clientHeight,document.documentElement.scrollHeight]);
          let scrollHeight = document.documentElement.scrollHeight;
          if (scrollHeight) {
            Invoke.postMessage(scrollHeight);
          }
        } catch {}
    ''');
  }

  _removeAd() async {
    await (await _controller.future)?.evaluateJavascript('''
        try {
          function removeElement(elementName){
            let _element = document.getElementById(elementName);
            if(!_element) {
              _element = document.querySelector(elementName);
            }
            if(!_element) {
              return;
            }
            let _parentElement = _element.parentNode;
            if(_parentElement){
                _parentElement.removeChild(_element);
            }
          }

          removeElement('.plista-wrap');
          removeElement('.news-talk');
          removeElement('#cmFooterWrap');
          removeElement('#cmFooterWrap');
          removeElement('.detail-btn-wrapper');
          removeElement('.disclaimer-of-fengmianhao');
          removeElement('.go-home-wrapper smaller);
          document.querySelector('.details-more-icon').click();
        } catch{}
        ''');
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: <Widget>[
          // 内容
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Divider(
                  height: 1,
                ),
                _buildPageHeader(appState.detailsList),
                // _buildWebView(appState.detailsList)
                _buildHtmlView()
              ],
            ),
          ),
          // 骨架屏
          // _isPageFinished == true ? Container() : cardProfileSkeleton()
        ],
      ),
    );
  }
}
