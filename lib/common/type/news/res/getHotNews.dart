// To parse this JSON data, do
//
//     final typeGetHotNewsResponse = typeGetHotNewsResponseFromJson(jsonString);

import 'dart:convert';

TypeGetHotNewsResponse typeGetHotNewsResponseFromJson(String str) =>
    TypeGetHotNewsResponse.fromJson(json.decode(str));

String typeGetHotNewsResponseToJson(TypeGetHotNewsResponse data) =>
    json.encode(data.toJson());

class TypeGetHotNewsResponse {
  TypeGetHotNewsResponse({
    this.data,
    this.message,
    this.status,
  });

  Data data;
  String message;
  int status;

  factory TypeGetHotNewsResponse.fromJson(Map<String, dynamic> json) =>
      TypeGetHotNewsResponse(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  Data({
    this.list,
  });

  List<ListElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.flag,
    this.happenTime,
    this.hasVideo,
    this.imgUrl,
    this.isPlistaAd,
    this.newsId,
    this.newsTitle,
    this.onBlockchain,
    this.replyCount,
    this.reviewCount,
    this.source,
    this.externalUrl,
  });

  int flag;
  int happenTime;
  bool hasVideo;
  String imgUrl;
  int isPlistaAd;
  int newsId;
  String newsTitle;
  bool onBlockchain;
  int replyCount;
  int reviewCount;
  String source;
  String externalUrl;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        flag: json["flag"],
        happenTime: json["happen_time"],
        hasVideo: json["has_video"],
        imgUrl: json["img_url"],
        isPlistaAd: json["is_plista_ad"],
        newsId: json["news_id"],
        newsTitle: json["news_title"],
        onBlockchain: json["on_blockchain"],
        replyCount: json["reply_count"],
        reviewCount: json["review_count"],
        source: json["source"],
        externalUrl: json["external_url"] == null ? null : json["external_url"],
      );

  Map<String, dynamic> toJson() => {
        "flag": flag,
        "happen_time": happenTime,
        "has_video": hasVideo,
        "img_url": imgUrl,
        "is_plista_ad": isPlistaAd,
        "news_id": newsId,
        "news_title": newsTitle,
        "on_blockchain": onBlockchain,
        "reply_count": replyCount,
        "review_count": reviewCount,
        "source": source,
        "external_url": externalUrl == null ? null : externalUrl,
      };
}
