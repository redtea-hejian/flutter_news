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
    AutoRoute(path: '/', page: IndexPage, usesTabsRouter: true),
    AutoRoute(
      path: '/application',
      page: ApplicationPage,
      usesTabsRouter: true,
    ),
    AutoRoute(path: '/detail', page: DetailPage),
    AutoRoute(path: '/signIn', page: SignInPage),
    AutoRoute(path: '/singUp', page: SignUpPage),
    AutoRoute(path: '/welcome', page: WelcomePage),
  ],
)
class $AppRouter {}
