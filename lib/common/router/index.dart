// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:flutter_news/page/application/index.dart';
import 'package:flutter_news/page/details/index.dart';
import 'package:flutter_news/page/index/index.dart';
import 'package:flutter_news/page/sign_in/index.dart';
import 'package:flutter_news/page/sign_up/index.dart';
import 'package:flutter_news/page/welcome/index.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: IndexPage, initial: true),
    AutoRoute(page: ApplicationPage),
    AutoRoute(page: DetailPage),
    AutoRoute(page: SignInPage),
    AutoRoute(page: SignUpPage),
    AutoRoute(page: WelcomePage),
  ],
)
class $AppRouter {}
