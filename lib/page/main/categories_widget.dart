import 'package:flutter/material.dart';
import 'package:flutter_news/common/type/news/res/getAllChannels.dart';
import 'package:flutter_news/common/utils/index.dart';
import 'package:flutter_news/common/values/colors.dart';

Widget newsCategoriesWidget({
  TypeGetAllChannelsResponse categories,
  int selectCategoryCode,
  Function onTap,
}) {
  List list = categories.toJson()['data']['list'];
  List<Widget> channels = [];
  for (var i = 0; i < list.length; i++) {
    dynamic item = list[i];
    channels.add(
      Container(
        alignment: Alignment.center,
        height: duSetHeight(52),
        padding: EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: GestureDetector(
          child: Text(
            item['channel'],
            style: TextStyle(
              color: selectCategoryCode == item['channel_id']
                  ? AppColors.secondaryElementText
                  : AppColors.primaryText,
              fontSize: duSetFontSize(18),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () => onTap(item),
        ),
      ),
    );
  }
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(children: channels),
  );
}
