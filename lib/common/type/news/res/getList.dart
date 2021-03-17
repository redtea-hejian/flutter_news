// To parse this JSON data, do
//
//     final typeGetListResponse = typeGetListResponseFromJson(jsonString);

import 'dart:convert';

TypeGetListResponse typeGetListResponseFromJson(String str) =>
    TypeGetListResponse.fromJson(json.decode(str));

String typeGetListResponseToJson(TypeGetListResponse data) =>
    json.encode(data.toJson());

class TypeGetListResponse {
  TypeGetListResponse({
    this.data,
    this.message,
    this.status,
  });

  Data data;
  String message;
  int status;

  factory TypeGetListResponse.fromJson(Map<String, dynamic> json) =>
      TypeGetListResponse(
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
    this.advert,
    this.banner,
    this.lastNewsId,
    this.list,
    this.onlyCache,
    this.showDownload,
  });

  Advert advert;
  List<Banner> banner;
  int lastNewsId;
  List<ListElement> list;
  bool onlyCache;
  bool showDownload;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        advert: Advert.fromJson(json["advert"]),
        banner:
            List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
        lastNewsId: json["last_news_id"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        onlyCache: json["onlyCache"],
        showDownload: json["show_download"],
      );

  Map<String, dynamic> toJson() => {
        "advert": advert.toJson(),
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
        "last_news_id": lastNewsId,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "onlyCache": onlyCache,
        "show_download": showDownload,
      };
}

class Advert {
  Advert({
    this.bannerAdList,
    this.newsFlowAdList,
  });

  List<dynamic> bannerAdList;
  List<dynamic> newsFlowAdList;

  factory Advert.fromJson(Map<String, dynamic> json) => Advert(
        bannerAdList: List<dynamic>.from(json["banner_ad_list"].map((x) => x)),
        newsFlowAdList:
            List<dynamic>.from(json["news_flow_ad_list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "banner_ad_list": List<dynamic>.from(bannerAdList.map((x) => x)),
        "news_flow_ad_list": List<dynamic>.from(newsFlowAdList.map((x) => x)),
      };
}

class Banner {
  Banner({
    this.externalUrl,
    this.flag,
    this.hasVideo,
    this.imgUrl,
    this.isInteractVideo,
    this.kind,
    this.label,
    this.newsId,
    this.newsKind,
    this.newsTitle,
    this.onBlockchain,
    this.reviewCount,
    this.source,
    this.subjectId,
    this.subjectName,
    this.subjectType,
  });

  String externalUrl;
  int flag;
  bool hasVideo;
  String imgUrl;
  bool isInteractVideo;
  int kind;
  int label;
  int newsId;
  int newsKind;
  String newsTitle;
  bool onBlockchain;
  int reviewCount;
  String source;
  int subjectId;
  String subjectName;
  int subjectType;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        externalUrl: json["external_url"],
        flag: json["flag"],
        hasVideo: json["has_video"],
        imgUrl: json["img_url"],
        isInteractVideo: json["is_interact_video"],
        kind: json["kind"],
        label: json["label"] == null ? null : json["label"],
        newsId: json["news_id"],
        newsKind: json["news_kind"],
        newsTitle: json["news_title"],
        onBlockchain: json["on_blockchain"],
        reviewCount: json["review_count"],
        source: json["source"],
        subjectId: json["subject_id"] == null ? null : json["subject_id"],
        subjectName: json["subject_name"] == null ? null : json["subject_name"],
        subjectType: json["subject_type"] == null ? null : json["subject_type"],
      );

  Map<String, dynamic> toJson() => {
        "external_url": externalUrl,
        "flag": flag,
        "has_video": hasVideo,
        "img_url": imgUrl,
        "is_interact_video": isInteractVideo,
        "kind": kind,
        "label": label == null ? null : label,
        "news_id": newsId,
        "news_kind": newsKind,
        "news_title": newsTitle,
        "on_blockchain": onBlockchain,
        "review_count": reviewCount,
        "source": source,
        "subject_id": subjectId == null ? null : subjectId,
        "subject_name": subjectName == null ? null : subjectName,
        "subject_type": subjectType == null ? null : subjectType,
      };
}

class ListElement {
  ListElement({
    this.author,
    this.brief,
    this.canComment,
    this.dislikeReason,
    this.externalUrl,
    this.flag,
    this.happenTime,
    this.hasVideo,
    this.imgUrl,
    this.isHot,
    this.isInteractVideo,
    this.isSubject,
    this.kind,
    this.label,
    this.newsId,
    this.newsKind,
    this.newsTitle,
    this.onBlockchain,
    this.praiseCount,
    this.replyCount,
    this.reviewCount,
    this.screenShotSwitch,
    this.shareUrl,
    this.source,
    this.sourceId,
    this.subjectIcon,
    this.subjectId,
    this.subjectName,
    this.subjectType,
    this.titleList,
  });

  Author author;
  String brief;
  bool canComment;
  DislikeReason dislikeReason;
  String externalUrl;
  int flag;
  int happenTime;
  bool hasVideo;
  String imgUrl;
  bool isHot;
  bool isInteractVideo;
  bool isSubject;
  int kind;
  int label;
  int newsId;
  int newsKind;
  String newsTitle;
  bool onBlockchain;
  int praiseCount;
  int replyCount;
  int reviewCount;
  bool screenShotSwitch;
  String shareUrl;
  String source;
  int sourceId;
  String subjectIcon;
  int subjectId;
  String subjectName;
  int subjectType;
  String titleList;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        author: authorValues.map[json["author"]],
        brief: json["brief"],
        canComment: json["can_comment"],
        dislikeReason: dislikeReasonValues.map[json["dislike_reason"]],
        externalUrl: json["external_url"] == null ? null : json["external_url"],
        flag: json["flag"],
        happenTime: json["happen_time"],
        hasVideo: json["has_video"],
        imgUrl: json["img_url"],
        isHot: json["is_hot"],
        isInteractVideo: json["is_interact_video"],
        isSubject: json["is_subject"],
        kind: json["kind"],
        label: json["label"] == null ? null : json["label"],
        newsId: json["news_id"],
        newsKind: json["news_kind"],
        newsTitle: json["news_title"],
        onBlockchain: json["on_blockchain"],
        praiseCount: json["praise_count"],
        replyCount: json["reply_count"],
        reviewCount: json["review_count"],
        screenShotSwitch: json["screen_shot_switch"],
        shareUrl: json["share_url"] == null ? null : json["share_url"],
        source: json["source"],
        sourceId: json["source_id"] == null ? null : json["source_id"],
        subjectIcon: json["subject_icon"] == null ? null : json["subject_icon"],
        subjectId: json["subject_id"] == null ? null : json["subject_id"],
        subjectName: json["subject_name"] == null ? null : json["subject_name"],
        subjectType: json["subject_type"] == null ? null : json["subject_type"],
        titleList: json["title_list"],
      );

  Map<String, dynamic> toJson() => {
        "author": authorValues.reverse[author],
        "brief": brief,
        "can_comment": canComment,
        "dislike_reason": dislikeReasonValues.reverse[dislikeReason],
        "external_url": externalUrl == null ? null : externalUrl,
        "flag": flag,
        "happen_time": happenTime,
        "has_video": hasVideo,
        "img_url": imgUrl,
        "is_hot": isHot,
        "is_interact_video": isInteractVideo,
        "is_subject": isSubject,
        "kind": kind,
        "label": label == null ? null : label,
        "news_id": newsId,
        "news_kind": newsKind,
        "news_title": newsTitle,
        "on_blockchain": onBlockchain,
        "praise_count": praiseCount,
        "reply_count": replyCount,
        "review_count": reviewCount,
        "screen_shot_switch": screenShotSwitch,
        "share_url": shareUrl == null ? null : shareUrl,
        "source": source,
        "source_id": sourceId == null ? null : sourceId,
        "subject_icon": subjectIcon == null ? null : subjectIcon,
        "subject_id": subjectId == null ? null : subjectId,
        "subject_name": subjectName == null ? null : subjectName,
        "subject_type": subjectType == null ? null : subjectType,
        "title_list": titleList,
      };
}

enum Author { EMPTY, AUTHOR, PURPLE }

final authorValues =
    EnumValues({"": Author.AUTHOR, "欧阳宏宇": Author.EMPTY, "钟晓璐": Author.PURPLE});

enum DislikeReason { EMPTY }

final dislikeReasonValues = EnumValues({"旧闻，重复,内容质量差": DislikeReason.EMPTY});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
