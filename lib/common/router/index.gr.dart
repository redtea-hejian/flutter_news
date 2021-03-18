// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i8;

import '../../page/application/index.dart' as _i3;
import '../../page/details/index.dart' as _i4;
import '../../page/index/index.dart' as _i2;
import '../../page/sign_in/index.dart' as _i5;
import '../../page/sign_up/index.dart' as _i6;
import '../../page/welcome/index.dart' as _i7;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    IndexRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<IndexRouteArgs>(orElse: () => IndexRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i2.IndexPage(key: args.key),
          maintainState: true,
          fullscreenDialog: false);
    },
    ApplicationRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<ApplicationRouteArgs>(orElse: () => ApplicationRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i3.ApplicationPage(key: args.key),
          maintainState: true,
          fullscreenDialog: false);
    },
    DetailRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<DetailRouteArgs>(orElse: () => DetailRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i4.DetailPage(key: args.key),
          maintainState: true,
          fullscreenDialog: false);
    },
    SignInRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<SignInRouteArgs>(orElse: () => SignInRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i5.SignInPage(key: args.key),
          maintainState: true,
          fullscreenDialog: false);
    },
    SignUpRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<SignUpRouteArgs>(orElse: () => SignUpRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i6.SignUpPage(key: args.key),
          maintainState: true,
          fullscreenDialog: false);
    },
    WelcomeRoute.name: (entry) {
      var args = entry.routeData
          .argsAs<WelcomeRouteArgs>(orElse: () => WelcomeRouteArgs());
      return _i1.MaterialPageX(
          entry: entry,
          child: _i7.WelcomePage(key: args.key),
          maintainState: true,
          fullscreenDialog: false);
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(IndexRoute.name,
            path: '/', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(ApplicationRoute.name,
            path: '/application-page', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(DetailRoute.name,
            path: '/detail-page', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(SignInRoute.name,
            path: '/sign-in-page', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(SignUpRoute.name,
            path: '/sign-up-page', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(WelcomeRoute.name,
            path: '/welcome-page', fullMatch: false, usesTabsRouter: false)
      ];
}

class IndexRoute extends _i1.PageRouteInfo<IndexRouteArgs> {
  IndexRoute({this.key})
      : super(name, path: '/', args: IndexRouteArgs(key: key));

  final _i8.Key key;

  static const String name = 'IndexRoute';
}

class IndexRouteArgs {
  const IndexRouteArgs({this.key});

  final _i8.Key key;
}

class ApplicationRoute extends _i1.PageRouteInfo<ApplicationRouteArgs> {
  ApplicationRoute({this.key})
      : super(name,
            path: '/application-page', args: ApplicationRouteArgs(key: key));

  final _i8.Key key;

  static const String name = 'ApplicationRoute';
}

class ApplicationRouteArgs {
  const ApplicationRouteArgs({this.key});

  final _i8.Key key;
}

class DetailRoute extends _i1.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({this.key})
      : super(name, path: '/detail-page', args: DetailRouteArgs(key: key));

  final _i8.Key key;

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({this.key});

  final _i8.Key key;
}

class SignInRoute extends _i1.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({this.key})
      : super(name, path: '/sign-in-page', args: SignInRouteArgs(key: key));

  final _i8.Key key;

  static const String name = 'SignInRoute';
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i8.Key key;
}

class SignUpRoute extends _i1.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({this.key})
      : super(name, path: '/sign-up-page', args: SignUpRouteArgs(key: key));

  final _i8.Key key;

  static const String name = 'SignUpRoute';
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i8.Key key;
}

class WelcomeRoute extends _i1.PageRouteInfo<WelcomeRouteArgs> {
  WelcomeRoute({this.key})
      : super(name, path: '/welcome-page', args: WelcomeRouteArgs(key: key));

  final _i8.Key key;

  static const String name = 'WelcomeRoute';
}

class WelcomeRouteArgs {
  const WelcomeRouteArgs({this.key});

  final _i8.Key key;
}
