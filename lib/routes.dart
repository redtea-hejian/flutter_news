// flutter 自带路由，用fluro后弃用
import 'package:flutter_news/page/application/index.dart';
import 'package:flutter_news/page/sign_in/index.dart';
import 'package:flutter_news/page/sign_up/index.dart';

var staticRoutes = {
  "/sign-in": (context) => SignInPage(), // 登录
  "/sign-up": (context) => SignUpPage(), // 注册
  "/app": (context) => ApplicationPage() // 主程序
};
