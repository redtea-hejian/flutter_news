// To parse this JSON data, do
//
//     final typeGetDetailResponse = typeGetDetailResponseFromJson(jsonString);

import 'dart:convert';

TypeGetDetailResponse typeGetDetailResponseFromJson(String str) =>
    TypeGetDetailResponse.fromJson(json.decode(str));

String typeGetDetailResponseToJson(TypeGetDetailResponse data) =>
    json.encode(data.toJson());

class TypeGetDetailResponse {
  TypeGetDetailResponse({
    this.data,
    this.message,
    this.status,
  });

  Data data;
  String message;
  int status;

  factory TypeGetDetailResponse.fromJson(Map<String, dynamic> json) =>
      TypeGetDetailResponse(
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
    this.audioEmpty,
    this.author,
    this.brief,
    this.canComment,
    this.collect,
    this.content,
    this.dateUpdate,
    this.declare,
    this.disclaimer,
    this.flag,
    this.happenTime,
    this.hasRelateNews,
    this.hasSeries,
    this.haveThumb,
    this.imgsUrl,
    this.isInteractVideo,
    this.kind,
    this.liveId,
    this.liveImgUrl,
    this.newsKindOrigin,
    this.newsId,
    this.newsTitle,
    this.owner,
    this.praise,
    this.praiseCount,
    this.relatedList,
    this.replyCount,
    this.reviewCount,
    this.screenShotSwitch,
    this.secondChannels,
    this.shareImg,
    this.shareTitle,
    this.shareUrl,
    this.showAd,
    this.showDownload,
    this.source,
    this.sourceId,
    this.sourceUrl,
    this.thousandFaceList,
    this.titleList,
  });

  bool audioEmpty;
  String author;
  String brief;
  bool canComment;
  bool collect;
  String content;
  int dateUpdate;
  String declare;
  String disclaimer;
  int flag;
  int happenTime;
  int hasRelateNews;
  bool hasSeries;
  bool haveThumb;
  String imgsUrl;
  bool isInteractVideo;
  int kind;
  int liveId;
  String liveImgUrl;
  int newsKindOrigin;
  int newsId;
  String newsTitle;
  Owner owner;
  bool praise;
  int praiseCount;
  List<RelatedListElement> relatedList;
  int replyCount;
  int reviewCount;
  bool screenShotSwitch;
  List<dynamic> secondChannels;
  String shareImg;
  String shareTitle;
  String shareUrl;
  bool showAd;
  bool showDownload;
  String source;
  int sourceId;
  String sourceUrl;
  List<RelatedListElement> thousandFaceList;
  String titleList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        audioEmpty: json["audioEmpty"],
        author: json["author"],
        brief: json["brief"],
        canComment: json["can_comment"],
        collect: json["collect"],
        content: json["content"],
        dateUpdate: json["date_update"],
        declare: json["declare"],
        disclaimer: json["disclaimer"],
        flag: json["flag"],
        happenTime: json["happen_time"],
        hasRelateNews: json["hasRelateNews"],
        hasSeries: json["hasSeries"],
        haveThumb: json["have_thumb"],
        imgsUrl: json["imgs_url"],
        isInteractVideo: json["is_interact_video"],
        kind: json["kind"],
        liveId: json["live_id"],
        liveImgUrl: json["live_img_url"],
        newsKindOrigin: json["newsKindOrigin"],
        newsId: json["news_id"],
        newsTitle: json["news_title"],
        owner: Owner.fromJson(json["owner"]),
        praise: json["praise"],
        praiseCount: json["praise_count"],
        relatedList: List<RelatedListElement>.from(
            json["related_list"].map((x) => RelatedListElement.fromJson(x))),
        replyCount: json["reply_count"],
        reviewCount: json["review_count"],
        screenShotSwitch: json["screen_shot_switch"],
        secondChannels:
            List<dynamic>.from(json["second_channels"].map((x) => x)),
        shareImg: json["share_img"],
        shareTitle: json["share_title"],
        shareUrl: json["share_url"],
        showAd: json["show_ad"],
        showDownload: json["show_download"],
        source: json["source"],
        sourceId: json["source_id"],
        sourceUrl: json["source_url"],
        thousandFaceList: List<RelatedListElement>.from(
            json["thousand_face_list"]
                .map((x) => RelatedListElement.fromJson(x))),
        titleList: json["title_list"],
      );

  Map<String, dynamic> toJson() => {
        "audioEmpty": audioEmpty,
        "author": author,
        "brief": brief,
        "can_comment": canComment,
        "collect": collect,
        "content": content,
        "date_update": dateUpdate,
        "declare": declare,
        "disclaimer": disclaimer,
        "flag": flag,
        "happen_time": happenTime,
        "hasRelateNews": hasRelateNews,
        "hasSeries": hasSeries,
        "have_thumb": haveThumb,
        "imgs_url": imgsUrl,
        "is_interact_video": isInteractVideo,
        "kind": kind,
        "live_id": liveId,
        "live_img_url": liveImgUrl,
        "newsKindOrigin": newsKindOrigin,
        "news_id": newsId,
        "news_title": newsTitle,
        "owner": owner.toJson(),
        "praise": praise,
        "praise_count": praiseCount,
        "related_list": List<dynamic>.from(relatedList.map((x) => x.toJson())),
        "reply_count": replyCount,
        "review_count": reviewCount,
        "screen_shot_switch": screenShotSwitch,
        "second_channels": List<dynamic>.from(secondChannels.map((x) => x)),
        "share_img": shareImg,
        "share_title": shareTitle,
        "share_url": shareUrl,
        "show_ad": showAd,
        "show_download": showDownload,
        "source": source,
        "source_id": sourceId,
        "source_url": sourceUrl,
        "thousand_face_list":
            List<dynamic>.from(thousandFaceList.map((x) => x.toJson())),
        "title_list": titleList,
      };
}

class Owner {
  Owner({
    this.channelId,
    this.channelType,
  });

  int channelId;
  int channelType;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        channelId: json["channelId"],
        channelType: json["channelType"],
      );

  Map<String, dynamic> toJson() => {
        "channelId": channelId,
        "channelType": channelType,
      };
}

class RelatedListElement {
  RelatedListElement({
    this.extraData,
    this.flag,
    this.happenTime,
    this.hasVideo,
    this.imgUrl,
    this.isPlistaAd,
    this.newsId,
    this.newsKind,
    this.newsTitle,
    this.onBlockchain,
    this.replyCount,
    this.reviewCount,
    this.source,
    this.isInteractVideo,
  });

  String extraData;
  int flag;
  int happenTime;
  bool hasVideo;
  String imgUrl;
  int isPlistaAd;
  int newsId;
  int newsKind;
  String newsTitle;
  bool onBlockchain;
  int replyCount;
  int reviewCount;
  String source;
  bool isInteractVideo;

  factory RelatedListElement.fromJson(Map<String, dynamic> json) =>
      RelatedListElement(
        extraData: json["extra_data"] == null ? null : json["extra_data"],
        flag: json["flag"],
        happenTime: json["happen_time"],
        hasVideo: json["has_video"],
        imgUrl: json["img_url"],
        isPlistaAd: json["is_plista_ad"],
        newsId: json["news_id"],
        newsKind: json["news_kind"],
        newsTitle: json["news_title"],
        onBlockchain: json["on_blockchain"],
        replyCount: json["reply_count"],
        reviewCount: json["review_count"],
        source: json["source"],
        isInteractVideo: json["is_interact_video"] == null
            ? null
            : json["is_interact_video"],
      );

  Map<String, dynamic> toJson() => {
        "extra_data": extraData == null ? null : extraData,
        "flag": flag,
        "happen_time": happenTime,
        "has_video": hasVideo,
        "img_url": imgUrl,
        "is_plista_ad": isPlistaAd,
        "news_id": newsId,
        "news_kind": newsKind,
        "news_title": newsTitle,
        "on_blockchain": onBlockchain,
        "reply_count": replyCount,
        "review_count": reviewCount,
        "source": source,
        "is_interact_video": isInteractVideo == null ? null : isInteractVideo,
      };
}
