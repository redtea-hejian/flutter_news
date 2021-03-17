import 'package:flutter/material.dart';
import 'package:flutter_news/common/type/news/res/getList.dart';
import 'package:flutter_news/common/utils/date.dart';
import 'package:flutter_news/common/utils/index.dart';
import 'package:flutter_news/common/values/index.dart';
import 'package:flutter_news/common/widgets/image.dart';

Widget newsWidget(TypeGetListResponse news) {
  List list = news.toJson()['data']['list'];
  List<Widget> channels = [];
  for (var i = 0; i < list.length; i++) {
    dynamic item = list[i];
    channels.add(Column(
      children: <Widget>[newsItemWidget(item)],
    ));
  }
  return Column(
    children: channels,
  );
}

Widget newsItemWidget(dynamic item) {
  DateTime happen_time =
      DateTime.fromMillisecondsSinceEpoch(item['happen_time']);
  return Container(
    height: duSetHeight(161),
    padding: EdgeInsets.all(duSetWidth(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        imageCached(
          url: item['img_url'],
          width: duSetWidth(121),
          height: duSetHeight(121),
        ),
        SizedBox(
          width: duSetWidth(194),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 作者
              Container(
                margin: EdgeInsets.all(0),
                child: Text(
                  item['source'],
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.normal,
                    color: AppColors.thirdElementText,
                    fontSize: duSetFontSize(14),
                    height: 1,
                  ),
                ),
              ),
              // 标题
              Container(
                margin: EdgeInsets.only(top: duSetHeight(10)),
                child: Text(
                  item['news_title'],
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText,
                    fontSize: duSetFontSize(16),
                    height: 1.3,
                  ),
                ),
              ),
              Spacer(),
              // 阅读数，时间，按钮
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // 分类
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: duSetWidth(70),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.remove_red_eye_outlined,
                            size: duSetFontSize(18),
                          ),
                          Text(
                            item['review_count'].toString(),
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.normal,
                              fontSize: duSetFontSize(14),
                              height: 1,
                            ),
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                          )
                        ],
                      ),
                    ),
                    // 添加时间
                    Container(
                      width: duSetWidth(15),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: duSetWidth(60),
                      ),
                      child: Text(
                        '• ${duTimeLineFormat(happen_time)}',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.normal,
                          color: AppColors.thirdElementText,
                          fontSize: duSetFontSize(14),
                          height: 1,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                    // 更多
                    Spacer(),
                    InkWell(
                      child: Icon(
                        Icons.more_horiz,
                        color: AppColors.primaryText,
                        size: 24,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
