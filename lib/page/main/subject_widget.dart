import 'package:flutter/cupertino.dart';
import 'package:flutter_news/common/type/news/res/getSubject.dart';
import 'package:flutter_news/common/utils/index.dart';
import 'package:flutter_news/common/values/index.dart';
import 'package:flutter_news/common/widgets/image.dart';

Widget subjectWidget(TypeGetSubjectResponse subject) {
  Map map = subject.toJson()['data'];
  String imgUrl = map['img_url'];
  String subjectName = map['subject_name'];
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxWidth: duSetWidth(335),
    ),
    child: Stack(
      alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
      children: <Widget>[
        imageCached(
          url: imgUrl,
          width: 335,
          height: 290,
        ),
        Positioned(
          bottom: duSetHeight(10),
          child: Text(
            subjectName,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              color: AppColors.primaryElementText,
              fontSize: duSetFontSize(18),
              height: 1.3,
            ),
          ),
        ),
      ],
    ),
  );
}
