// To parse this JSON data, do
//
//     final typeGetWapRelatedNewsResponse = typeGetWapRelatedNewsResponseFromJson(jsonString);

import 'dart:convert';

TypeGetWapRelatedNewsResponse typeGetWapRelatedNewsResponseFromJson(
        String str) =>
    TypeGetWapRelatedNewsResponse.fromJson(json.decode(str));

String typeGetWapRelatedNewsResponseToJson(
        TypeGetWapRelatedNewsResponse data) =>
    json.encode(data.toJson());

class TypeGetWapRelatedNewsResponse {
  TypeGetWapRelatedNewsResponse({
    this.data,
    this.message,
    this.status,
  });

  Data data;
  String message;
  int status;

  factory TypeGetWapRelatedNewsResponse.fromJson(Map<String, dynamic> json) =>
      TypeGetWapRelatedNewsResponse(
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
    this.newsList,
    this.advertList,
    this.videoList,
  });

  List<NewsList> newsList;
  List<dynamic> advertList;
  List<dynamic> videoList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        newsList: List<NewsList>.from(
            json["news_list"].map((x) => NewsList.fromJson(x))),
        advertList: List<dynamic>.from(json["advert_list"].map((x) => x)),
        videoList: List<dynamic>.from(json["video_list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "news_list": List<dynamic>.from(newsList.map((x) => x.toJson())),
        "advert_list": List<dynamic>.from(advertList.map((x) => x)),
        "video_list": List<dynamic>.from(videoList.map((x) => x)),
      };
}

class NewsList {
  NewsList({
    this.externalUrl,
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
  });

  String externalUrl;
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

  factory NewsList.fromJson(Map<String, dynamic> json) => NewsList(
        externalUrl: json["external_url"],
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
      );

  Map<String, dynamic> toJson() => {
        "external_url": externalUrl,
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
      };
}
