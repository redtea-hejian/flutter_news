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
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
        "message": message == null ? null : message,
        "status": status == null ? null : status,
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
        advert: json["advert"] == null ? null : Advert.fromJson(json["advert"]),
        banner: json["banner"] == null
            ? null
            : List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
        lastNewsId: json["last_news_id"] == null ? null : json["last_news_id"],
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
        onlyCache: json["onlyCache"] == null ? null : json["onlyCache"],
        showDownload:
            json["show_download"] == null ? null : json["show_download"],
      );

  Map<String, dynamic> toJson() => {
        "advert": advert == null ? null : advert.toJson(),
        "banner": banner == null
            ? null
            : List<dynamic>.from(banner.map((x) => x.toJson())),
        "last_news_id": lastNewsId == null ? null : lastNewsId,
        "list": list == null
            ? null
            : List<dynamic>.from(list.map((x) => x.toJson())),
        "onlyCache": onlyCache == null ? null : onlyCache,
        "show_download": showDownload == null ? null : showDownload,
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
        bannerAdList: json["banner_ad_list"] == null
            ? null
            : List<dynamic>.from(json["banner_ad_list"].map((x) => x)),
        newsFlowAdList: json["news_flow_ad_list"] == null
            ? null
            : List<dynamic>.from(json["news_flow_ad_list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "banner_ad_list": bannerAdList == null
            ? null
            : List<dynamic>.from(bannerAdList.map((x) => x)),
        "news_flow_ad_list": newsFlowAdList == null
            ? null
            : List<dynamic>.from(newsFlowAdList.map((x) => x)),
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
    this.videoTime,
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
  int videoTime;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        externalUrl: json["external_url"] == null ? null : json["external_url"],
        flag: json["flag"] == null ? null : json["flag"],
        hasVideo: json["has_video"] == null ? null : json["has_video"],
        imgUrl: json["img_url"] == null ? null : json["img_url"],
        isInteractVideo: json["is_interact_video"] == null
            ? null
            : json["is_interact_video"],
        kind: json["kind"] == null ? null : json["kind"],
        label: json["label"] == null ? null : json["label"],
        newsId: json["news_id"] == null ? null : json["news_id"],
        newsKind: json["news_kind"] == null ? null : json["news_kind"],
        newsTitle: json["news_title"] == null ? null : json["news_title"],
        onBlockchain:
            json["on_blockchain"] == null ? null : json["on_blockchain"],
        reviewCount: json["review_count"] == null ? null : json["review_count"],
        source: json["source"] == null ? null : json["source"],
        subjectId: json["subject_id"] == null ? null : json["subject_id"],
        subjectName: json["subject_name"] == null ? null : json["subject_name"],
        subjectType: json["subject_type"] == null ? null : json["subject_type"],
        videoTime: json["video_time"] == null ? null : json["video_time"],
      );

  Map<String, dynamic> toJson() => {
        "external_url": externalUrl == null ? null : externalUrl,
        "flag": flag == null ? null : flag,
        "has_video": hasVideo == null ? null : hasVideo,
        "img_url": imgUrl == null ? null : imgUrl,
        "is_interact_video": isInteractVideo == null ? null : isInteractVideo,
        "kind": kind == null ? null : kind,
        "label": label == null ? null : label,
        "news_id": newsId == null ? null : newsId,
        "news_kind": newsKind == null ? null : newsKind,
        "news_title": newsTitle == null ? null : newsTitle,
        "on_blockchain": onBlockchain == null ? null : onBlockchain,
        "review_count": reviewCount == null ? null : reviewCount,
        "source": source == null ? null : source,
        "subject_id": subjectId == null ? null : subjectId,
        "subject_name": subjectName == null ? null : subjectName,
        "subject_type": subjectType == null ? null : subjectType,
        "video_time": videoTime == null ? null : videoTime,
      };
}

class ListElement {
  ListElement({
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
    this.newsId,
    this.newsKind,
    this.newsTitle,
    this.onBlockchain,
    this.praiseCount,
    this.replyCount,
    this.reviewCount,
    this.screenShotSwitch,
    this.source,
    this.sourceId,
    this.titleList,
    this.label,
    this.shareUrl,
    this.subjectIcon,
    this.subjectId,
    this.subjectName,
    this.subjectType,
    this.author,
  });

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
  int newsId;
  int newsKind;
  String newsTitle;
  bool onBlockchain;
  int praiseCount;
  int replyCount;
  int reviewCount;
  bool screenShotSwitch;
  String source;
  int sourceId;
  String titleList;
  int label;
  String shareUrl;
  String subjectIcon;
  int subjectId;
  String subjectName;
  int subjectType;
  String author;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        brief: json["brief"] == null ? null : json["brief"],
        canComment: json["can_comment"] == null ? null : json["can_comment"],
        dislikeReason: json["dislike_reason"] == null
            ? null
            : dislikeReasonValues.map[json["dislike_reason"]],
        externalUrl: json["external_url"] == null ? null : json["external_url"],
        flag: json["flag"] == null ? null : json["flag"],
        happenTime: json["happen_time"] == null ? null : json["happen_time"],
        hasVideo: json["has_video"] == null ? null : json["has_video"],
        imgUrl: json["img_url"] == null ? null : json["img_url"],
        isHot: json["is_hot"] == null ? null : json["is_hot"],
        isInteractVideo: json["is_interact_video"] == null
            ? null
            : json["is_interact_video"],
        isSubject: json["is_subject"] == null ? null : json["is_subject"],
        kind: json["kind"] == null ? null : json["kind"],
        newsId: json["news_id"] == null ? null : json["news_id"],
        newsKind: json["news_kind"] == null ? null : json["news_kind"],
        newsTitle: json["news_title"] == null ? null : json["news_title"],
        onBlockchain:
            json["on_blockchain"] == null ? null : json["on_blockchain"],
        praiseCount: json["praise_count"] == null ? null : json["praise_count"],
        replyCount: json["reply_count"] == null ? null : json["reply_count"],
        reviewCount: json["review_count"] == null ? null : json["review_count"],
        screenShotSwitch: json["screen_shot_switch"] == null
            ? null
            : json["screen_shot_switch"],
        source: json["source"] == null ? null : json["source"],
        sourceId: json["source_id"] == null ? null : json["source_id"],
        titleList: json["title_list"] == null ? null : json["title_list"],
        label: json["label"] == null ? null : json["label"],
        shareUrl: json["share_url"] == null ? null : json["share_url"],
        subjectIcon: json["subject_icon"] == null ? null : json["subject_icon"],
        subjectId: json["subject_id"] == null ? null : json["subject_id"],
        subjectName: json["subject_name"] == null ? null : json["subject_name"],
        subjectType: json["subject_type"] == null ? null : json["subject_type"],
        author: json["author"] == null ? null : json["author"],
      );

  Map<String, dynamic> toJson() => {
        "brief": brief == null ? null : brief,
        "can_comment": canComment == null ? null : canComment,
        "dislike_reason": dislikeReason == null
            ? null
            : dislikeReasonValues.reverse[dislikeReason],
        "external_url": externalUrl == null ? null : externalUrl,
        "flag": flag == null ? null : flag,
        "happen_time": happenTime == null ? null : happenTime,
        "has_video": hasVideo == null ? null : hasVideo,
        "img_url": imgUrl == null ? null : imgUrl,
        "is_hot": isHot == null ? null : isHot,
        "is_interact_video": isInteractVideo == null ? null : isInteractVideo,
        "is_subject": isSubject == null ? null : isSubject,
        "kind": kind == null ? null : kind,
        "news_id": newsId == null ? null : newsId,
        "news_kind": newsKind == null ? null : newsKind,
        "news_title": newsTitle == null ? null : newsTitle,
        "on_blockchain": onBlockchain == null ? null : onBlockchain,
        "praise_count": praiseCount == null ? null : praiseCount,
        "reply_count": replyCount == null ? null : replyCount,
        "review_count": reviewCount == null ? null : reviewCount,
        "screen_shot_switch":
            screenShotSwitch == null ? null : screenShotSwitch,
        "source": source == null ? null : source,
        "source_id": sourceId == null ? null : sourceId,
        "title_list": titleList == null ? null : titleList,
        "label": label == null ? null : label,
        "share_url": shareUrl == null ? null : shareUrl,
        "subject_icon": subjectIcon == null ? null : subjectIcon,
        "subject_id": subjectId == null ? null : subjectId,
        "subject_name": subjectName == null ? null : subjectName,
        "subject_type": subjectType == null ? null : subjectType,
        "author": author == null ? null : author,
      };
}

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
