import 'package:flutter/material.dart';
import 'package:flutter_news/common/router/application.dart';
import 'package:flutter_news/common/utils/index.dart';
import 'package:flutter_news/common/values/index.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  /// 页头标题
  Widget _buildPageHeadTitle() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(60 + 44.0)), // 顶部系统栏 44px
      child: Text(
        "Features",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: duSetFontSize(24),
          height: 1,
        ),
      ),
    );
  }

  /// 页头说明
  Widget _buildPageHeaderDetail() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(14)),
      child: Text(
        "The best of news channels all in one place. Trusted sources and personalized news for you.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.normal,
          fontSize: duSetFontSize(16),
          height: 1.3,
        ),
      ),
    );
  }

  /// 特性说明
  ///  flex布局
  Widget _buildFeatureItem(String imageName, String intro, double marginTop) {
    return Container(
      height: duSetHeight(80),
      margin: EdgeInsets.only(top: duSetHeight(marginTop)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Image.asset(
              "assets/images/$imageName.png",
              fit: BoxFit.none,
            ),
          ),
          Container(
            width: duSetWidth(195),
            child: Text(
              intro,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: duSetFontSize(16),
              ),
            ),
          ),
          // Spacer(),
        ],
      ),
    );
  }

  /// 开始按钮
  Widget _buildStartButton(BuildContext context) {
    return Container(
      width: duSetWidth(295),
      height: duSetHeight(44),
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: ElevatedButton(
        child: Text("Get started"),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryElement),
          shadowColor:
              MaterialStateProperty.all<Color>(AppColors.primaryElementText),
        ),
        onPressed: () {
          Application.router.navigateTo(context, '/signIn');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: duSetWidth(40), right: duSetWidth(40)),
          child: Column(
            children: <Widget>[
              _buildPageHeadTitle(),
              _buildPageHeaderDetail(),
              _buildFeatureItem(
                "feature-1",
                "Compelling photography and typography provide a beautiful reading",
                86,
              ),
              _buildFeatureItem(
                "feature-2",
                "Sector news never shares your personal data with advertisers or publishers",
                40,
              ),
              _buildFeatureItem(
                "feature-3",
                "You can get Premium to unlock hundreds of publications",
                40,
              ),
              Spacer(),
              _buildStartButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
