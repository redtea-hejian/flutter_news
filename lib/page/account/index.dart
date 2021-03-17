import 'package:flutter/material.dart';
import 'package:flutter_news/global.dart';
import 'package:provider/provider.dart';
import 'package:flutter_news/common/provider/index.dart';
import 'package:flutter_news/common/utils/authentication.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    // 查询状态对象
    final appState = Provider.of<AppState>(context);
    return Column(
      children: <Widget>[
        Text('用户: ${Global.profile.displayName}'),
        Divider(),
        MaterialButton(
          onPressed: () {
            goLoginPage(context);
          },
          child: Text('logout'),
        ),
        Divider(),
        MaterialButton(
          onPressed: () {
            appState.switchGrayFilter();
          },
          child: Text('灰色${appState.isGrayFilter}'),
        ),
      ],
    );
  }
}
