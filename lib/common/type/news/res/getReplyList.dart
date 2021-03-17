// To parse this JSON data, do
//
//     final typeGetReplyListResponse = typeGetReplyListResponseFromJson(jsonString);

import 'dart:convert';

TypeGetReplyListResponse typeGetReplyListResponseFromJson(String str) =>
    TypeGetReplyListResponse.fromJson(json.decode(str));

String typeGetReplyListResponseToJson(TypeGetReplyListResponse data) =>
    json.encode(data.toJson());

class TypeGetReplyListResponse {
  TypeGetReplyListResponse({
    this.data,
    this.message,
    this.status,
  });

  Data data;
  String message;
  int status;

  factory TypeGetReplyListResponse.fromJson(Map<String, dynamic> json) =>
      TypeGetReplyListResponse(
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
    this.total,
    this.list,
  });

  int total;
  List<ListElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.avatar,
    this.content,
    this.happenTime,
    this.labelKind,
    this.nickname,
    this.relateType,
    this.replyDeleted,
    this.replyId,
    this.status,
    this.userId,
  });

  String avatar;
  String content;
  int happenTime;
  int labelKind;
  String nickname;
  int relateType;
  bool replyDeleted;
  int replyId;
  int status;
  int userId;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        avatar: json["avatar"] == null ? null : json["avatar"],
        content: json["content"],
        happenTime: json["happen_time"],
        labelKind: json["label_kind"],
        nickname: json["nickname"],
        relateType: json["relate_type"],
        replyDeleted: json["reply_deleted"],
        replyId: json["reply_id"],
        status: json["status"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar == null ? null : avatar,
        "content": content,
        "happen_time": happenTime,
        "label_kind": labelKind,
        "nickname": nickname,
        "relate_type": relateType,
        "reply_deleted": replyDeleted,
        "reply_id": replyId,
        "status": status,
        "user_id": userId,
      };
}
