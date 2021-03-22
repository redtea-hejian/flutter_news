import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/common/router/application.dart';
import 'package:flutter_news/common/router/index.dart';
import 'package:flutter_news/global.dart';
import 'package:flutter_news/page/application/index.dart';
import 'package:flutter_news/page/sign_in/index.dart';
import 'package:flutter_news/page/welcome/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('index init');
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
    return ScreenUtilInit(
      designSize: Size(375, 734), // 812 - 44 - 34 = 734
      allowFontScaling: false,
      builder: () => MaterialApp(
        title: 'Cover news',
        home: Scaffold(
          body: Global.isFirstOpen == true
              ? WelcomePage()
              : Global.isOfflineLogin == true
                  ? ApplicationPage()
                  : SignInPage(),
        ),
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
