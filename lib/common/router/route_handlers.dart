import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_news/page/application/index.dart';
import 'package:flutter_news/page/details/index.dart';
import 'package:flutter_news/page/sign_in/index.dart';
import 'package:flutter_news/page/sign_up/index.dart';
import 'package:flutter_news/page/welcome/index.dart';

Handler applicationHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return ApplicationPage();
  },
);
Handler signInHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return SignInPage();
  },
);
Handler signUpHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return SignUpPage();
  },
);
Handler welcomeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return WelcomePage();
  },
);
Handler detailsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String id = params["id"][0];
    print('index id->$id $params');
    return DetailPage(
      newsId: id,
    );
  },
);
