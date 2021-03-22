import 'package:flutter/material.dart';
import 'package:flutter_news/common/type/news/res/getHotNews.dart';
import 'package:flutter_news/common/type/news/res/getList.dart';
import 'package:flutter_news/common/utils/date.dart';
import 'package:flutter_news/common/utils/screen.dart';
import 'package:flutter_news/common/values/colors.dart';
import 'package:flutter_news/common/widgets/index.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//  List<String> imgs = [
//       'https://imgcdn.thecover.cn/newscontent-3d1d2023-f32a-4db4-94bd-d6db7131d25d-1615949218844.jpg',
//       'https://imgcdn.thecover.cn/newscontent-fcd19388-c13e-4b11-8f43-da8075cd36c9-1614391829826.jpg',
//       'https://imgcdn.thecover.cn/newscontent-ca8dd5d7-d669-4921-a92b-a96716ec7f84-1615106956070.jpg',
//       'https://imgcdn.thecover.cn/newscontent-ef7f5306-036f-4c1c-8104-24e2243e3728-1615968042325.jpg'
//     ];

Widget recommendWidget(TypeGetHotNewsResponse news, Function(dynamic) onTap) {
  List list = news.toJson()['data']['list'];

  return Container(
    margin: EdgeInsets.all(duSetWidth(20)),
    child: Container(
      height: duSetHeight(412),
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          dynamic item = list[index];
          DateTime happenTime =
              DateTime.fromMillisecondsSinceEpoch(item['happen_time']);
          return GestureDetector(
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
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
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
                      Container(
                        width: duSetWidth(15),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 120,
                        ),
                        child: Text(
                          '• ${duTimeLineFormat(happenTime)}',
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
            onTap: () => onTap(item),
          );
        },
        itemCount: list.length,
      ),
    ),
  );
}

Widget bannerWidget(TypeGetListResponse news) {
  List list = news.toJson()['data']['banner'];
  return list == null
      ? Container()
      : Container(
          margin: EdgeInsets.all(duSetWidth(20)),
          child: Container(
            height: duSetHeight(412),
            child: new Swiper(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                dynamic item = list[index];
                return Column(
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
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
                          Container(
                            width: duSetWidth(15),
                          ),
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
                );
              },
            ),
          ),
        );
}
