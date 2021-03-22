import 'package:flutter/material.dart';

// 创建响应类
class AppState with ChangeNotifier {
  bool _isGrayFilter;
  Map _detailsList;
  int _curSelectCode = 9;
  int _channelType = 1;
  // 获取
  get isGrayFilter => _isGrayFilter;
  get detailsList => _detailsList;
  get curSelectCode => _curSelectCode;
  get channelType => _channelType;
  // 设置
  AppState(
      {bool isGrayFilter = false,
      dynamic detailsList,
      int curSelectCode,
      int channelType}) {
    this._isGrayFilter = isGrayFilter;
    this._detailsList = detailsList;
    this._curSelectCode = curSelectCode;
    this._channelType = channelType;
  }
  switchGrayFilter() {
    _isGrayFilter = !isGrayFilter;
    notifyListeners();
  }

  setDetailList(item) {
    _detailsList = item;
    notifyListeners();
  }

  setChannelData({int code, int type}) {
    _curSelectCode = code;
    _channelType = type;
    notifyListeners();
  }
}
