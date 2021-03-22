import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';

/// 透明背景 AppBar
Widget transparentAppBar({
  @required BuildContext context,
  Widget title,
  Widget leading,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title,
    leading: leading,
    actions: actions,
  );
}

Widget cardListSkeleton() {
  return PKCardPageSkeleton(
    totalLines: 5,
  );
}

Widget cardProfileSkeleton() {
  return PKCardProfileSkeleton(
    isCircularImage: true,
    isBottomLinesActive: true,
  );
}
