import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_news/common/router/route_handlers.dart';

class Routes {
  static String root = '/';
  static String signIn = '/signIn';
  static String signUp = '/signUp';
  static String welcome = '/welcome';
  static String detailsPage = '/details/:id';
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        print("ROUTE WAS NOT FOUND !!!");
        return;
      },
    );
    router.define(root, handler: applicationHandler);
    router.define(signIn, handler: signInHandler);
    router.define(signUp, handler: signUpHandler);
    router.define(welcome, handler: welcomeHandler);
    router.define(
      detailsPage,
      handler: detailsHandler,
    );
  }
}
