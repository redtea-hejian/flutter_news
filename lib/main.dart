import 'package:flutter/material.dart';
import 'package:flutter_news/page/welcome/index.dart';
import 'package:flutter_news/routes.dart';
import 'package:flutter_screenutil/screenutil_init.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 734), // 812 - 44 - 34 = 734
      allowFontScaling: false,
      builder: () => MaterialApp(
        title: 'flutter news',
        home: WelcomePage(),
        routes: staticRoutes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
