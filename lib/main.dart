import 'package:flutter/material.dart';
import 'package:flutter_news/common/router/index.gr.dart';
import 'package:flutter_news/global.dart';
import 'package:flutter_news/page/index/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_news/common/provider/index.dart';

void main() => Global.init().then(
      (e) => runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<AppState>.value(
              value: Global.appState,
            )
          ],
          child: Consumer<AppState>(builder: (context, appState, _) {
            if (appState.isGrayFilter) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
                child: MyApp(),
              );
            } else {
              return MyApp();
            }
          }),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    // return IndexPage();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(
        initialDeepLink: '/',
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
