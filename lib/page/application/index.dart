import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/index.dart';
import 'package:flutter_news/common/values/index.dart';
import 'package:flutter_news/common/widgets/index.dart';
import 'package:flutter_news/page/account/index.dart';
import 'package:flutter_news/page/bookmarks/index.dart';
import 'package:flutter_news/page/category/index.dart';
import 'package:flutter_news/page/main/index.dart';

class ApplicationPage extends StatefulWidget {
  ApplicationPage({Key key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  int _page = 0;
  final List<String> _tabTitles = ["Home", "Cagegory", "Bookmarks", "Account"];
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.home,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.home,
        color: AppColors.secondaryElementText,
      ),
      label: 'main',
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.grid,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.grid,
        color: AppColors.secondaryElementText,
      ),
      label: 'category',
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.tag,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.tag,
        color: AppColors.secondaryElementText,
      ),
      label: 'tag',
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.me,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.me,
        color: AppColors.secondaryElementText,
      ),
      label: 'My',
      backgroundColor: AppColors.primaryBackground,
    ),
  ];
  PageController _pageController;
  void _handleNavBarTap(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  void _handlePageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: this._page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildAppbar() {
    return transparentAppBar(
      context: context,
      title: Text(
        _tabTitles[_page],
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Montserrat',
          fontSize: duSetFontSize(18),
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: AppColors.primaryText,
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildBody() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        MainPage(),
        CategoryPage(),
        BookmarksPage(),
        AccountPage()
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  Widget _buildBottomNavigationbar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: _handleNavBarTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationbar(),
    );
  }
}
