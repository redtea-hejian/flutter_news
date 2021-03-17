// To parse this JSON data, do
//
//     final typeGetSubjectResponse = typeGetSubjectResponseFromJson(jsonString);

import 'dart:convert';

TypeGetSubjectResponse typeGetSubjectResponseFromJson(String str) =>
    TypeGetSubjectResponse.fromJson(json.decode(str));

String typeGetSubjectResponseToJson(TypeGetSubjectResponse data) =>
    json.encode(data.toJson());

class TypeGetSubjectResponse {
  TypeGetSubjectResponse({
    this.data,
    this.message,
    this.status,
  });

  Data data;
  String message;
  int status;

  factory TypeGetSubjectResponse.fromJson(Map<String, dynamic> json) =>
      TypeGetSubjectResponse(
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
    this.bigImg,
    this.channelType,
    this.imgUrl,
    this.isSpringFestival,
    this.isSubscribe,
    this.kind,
    this.list,
    this.shareImg,
    this.shareTitle,
    this.shareUrl,
    this.subjectDesc,
    this.subjectId,
    this.subjectName,
  });

  String bigImg;
  int channelType;
  String imgUrl;
  bool isSpringFestival;
  bool isSubscribe;
  int kind;
  List<ListElement> list;
  String shareImg;
  String shareTitle;
  String shareUrl;
  String subjectDesc;
  int subjectId;
  String subjectName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bigImg: json["big_img"],
        channelType: json["channel_type"],
        imgUrl: json["img_url"],
        isSpringFestival: json["is_spring_festival"],
        isSubscribe: json["is_subscribe"],
        kind: json["kind"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        shareImg: json["share_img"],
        shareTitle: json["share_title"],
        shareUrl: json["share_url"],
        subjectDesc: json["subject_desc"],
        subjectId: json["subject_id"],
        subjectName: json["subject_name"],
      );

  Map<String, dynamic> toJson() => {
        "big_img": bigImg,
        "channel_type": channelType,
        "img_url": imgUrl,
        "is_spring_festival": isSpringFestival,
        "is_subscribe": isSubscribe,
        "kind": kind,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "share_img": shareImg,
        "share_title": shareTitle,
        "share_url": shareUrl,
        "subject_desc": subjectDesc,
        "subject_id": subjectId,
        "subject_name": subjectName,
      };
}

class ListElement {
  ListElement({
    this.categoryId,
    this.categoryName,
    this.isFold,
    this.news,
  });

  int categoryId;
  String categoryName;
  int isFold;
  List<News> news;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        isFold: json["is_fold"],
        news: List<News>.from(json["news"].map((x) => News.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "is_fold": isFold,
        "news": List<dynamic>.from(news.map((x) => x.toJson())),
      };
}

class News {
  News({
    this.brief,
    this.extKind,
    this.externalUrl,
    this.flag,
    this.happenTime,
    this.img169,
    this.img43,
    this.imgUrl,
    this.isInteractVideo,
    this.isSubject,
    this.kind,
    this.listKind,
    this.newsId,
    this.newsKind,
    this.newsTitle,
    this.onBlockchain,
    this.replyCount,
    this.reviewCount,
    this.source,
    this.videoTime,
  });

  String brief;
  int extKind;
  String externalUrl;
  int flag;
  int happenTime;
  String img169;
  String img43;
  String imgUrl;
  bool isInteractVideo;
  bool isSubject;
  int kind;
  int listKind;
  int newsId;
  int newsKind;
  String newsTitle;
  bool onBlockchain;
  int replyCount;
  int reviewCount;
  String source;
  int videoTime;

  factory News.fromJson(Map<String, dynamic> json) => News(
        brief: json["brief"],
        extKind: json["extKind"],
        externalUrl: json["external_url"] == null ? null : json["external_url"],
        flag: json["flag"],
        happenTime: json["happen_time"],
        img169: json["img169"],
        img43: json["img43"],
        imgUrl: json["img_url"],
        isInteractVideo: json["is_interact_video"] == null
            ? null
            : json["is_interact_video"],
        isSubject: json["is_subject"],
        kind: json["kind"],
        listKind: json["listKind"],
        newsId: json["news_id"],
        newsKind: json["news_kind"],
        newsTitle: json["news_title"],
        onBlockchain: json["on_blockchain"],
        replyCount: json["reply_count"],
        reviewCount: json["review_count"],
        source: json["source"],
        videoTime: json["video_time"] == null ? null : json["video_time"],
      );

  Map<String, dynamic> toJson() => {
        "brief": brief,
        "extKind": extKind,
        "external_url": externalUrl == null ? null : externalUrl,
        "flag": flag,
        "happen_time": happenTime,
        "img169": img169,
        "img43": img43,
        "img_url": imgUrl,
        "is_interact_video": isInteractVideo == null ? null : isInteractVideo,
        "is_subject": isSubject,
        "kind": kind,
        "listKind": listKind,
        "news_id": newsId,
        "news_kind": newsKind,
        "news_title": newsTitle,
        "on_blockchain": onBlockchain,
        "reply_count": replyCount,
        "review_count": reviewCount,
        "source": source,
        "video_time": videoTime == null ? null : videoTime,
      };
}
