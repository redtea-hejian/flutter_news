import 'package:flutter/material.dart';
import 'package:flutter_news/common/type/news/res/getList.dart';
import 'package:flutter_news/common/utils/screen.dart';
import 'package:flutter_news/common/values/colors.dart';
import 'package:flutter_news/common/widgets/index.dart';

Widget recommendWidget(TypeGetListResponse news) {
  List list = news.toJson()['data']['banner'];
  dynamic item = list[0];

  return Container(
    margin: EdgeInsets.all(duSetWidth(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 图片
        imageCached(
          url: item['img_url'],
          width: 335,
          height: 290,
        ),
        // 来源
        Container(
          margin: EdgeInsets.only(top: duSetHeight(14)),
          child: Text(
            item['source'],
            style: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              color: AppColors.thirdElementText,
              fontSize: duSetFontSize(14),
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
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
              fontSize: duSetFontSize(18),
              height: 1.3,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: duSetHeight(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 120),
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
              // 时间
              // Container(
              //   width: duSetWidth(15),
              // ),
              // ConstrainedBox(
              //   constraints: const BoxConstraints(
              //     maxWidth: 120,
              //   ),
              //   child: Text(
              //     '• ${duTimeLineFormat(happen_time)}',
              //     style: TextStyle(
              //       fontFamily: 'Avenir',
              //       fontWeight: FontWeight.normal,
              //       color: AppColors.thirdElementText,
              //       fontSize: duSetFontSize(14),
              //       height: 1,
              //     ),
              //     overflow: TextOverflow.clip,
              //     maxLines: 1,
              //   ),
              // ),
              Spacer(),
              InkWell(
                child: Icon(
                  Icons.more_horiz,
                  color: AppColors.primaryText,
                  size: 24,
                ),
                onTap: () {},
              )
            ],
          ),
        )
      ],
    ),
  );
}
