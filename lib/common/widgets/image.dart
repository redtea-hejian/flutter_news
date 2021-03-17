import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/index.dart';
import 'package:flutter_news/common/values/index.dart';

Widget imageCached({
  String url,
  double width = 48,
  double height = 48,
  EdgeInsetsGeometry margin,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: Radii.k6pxRadius,
    ),
    child: ClipRRect(
      borderRadius: Radii.k6pxRadius,
      child: new FadeInImage.assetNetwork(
        height: duSetHeight(height),
        width: duSetWidth(width),
        placeholder: 'assets/images/placeholder.jpeg',
        image: url,
        alignment: Alignment.center,
        fit: BoxFit.cover,
        imageErrorBuilder: (context, error, stackTrace) => Icon(Icons.error),
        fadeInDuration: Duration(seconds: 1),
      ),
    ),
  );
}
