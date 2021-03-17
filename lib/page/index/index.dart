import 'package:flutter/material.dart';
import 'package:flutter_news/global.dart';
import 'package:flutter_news/page/application/index.dart';
import 'package:flutter_news/page/sign_in/index.dart';
import 'package:flutter_news/page/welcome/index.dart';
import 'package:flutter_news/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 734), // 812 - 44 - 34 = 734
      allowFontScaling: false,
      builder: () => MaterialApp(
        title: 'flutter news',
        home: Scaffold(
          body: Global.isFirstOpen == true
              ? WelcomePage()
              : Global.isOfflineLogin == true
                  ? ApplicationPage()
                  : SignInPage(),
        ),
        routes: staticRoutes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
