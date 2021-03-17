// To parse this JSON data, do
//
//     final typeGetAllChannelsResponse = typeGetAllChannelsResponseFromJson(jsonString);

import 'dart:convert';

TypeGetAllChannelsResponse typeGetAllChannelsResponseFromJson(String str) =>
    TypeGetAllChannelsResponse.fromJson(json.decode(str));

String typeGetAllChannelsResponseToJson(TypeGetAllChannelsResponse data) =>
    json.encode(data.toJson());

class TypeGetAllChannelsResponse {
  TypeGetAllChannelsResponse({
    this.data,
    this.message,
    this.status,
  });

  Data data;
  String message;
  int status;

  factory TypeGetAllChannelsResponse.fromJson(Map<String, dynamic> json) =>
      TypeGetAllChannelsResponse(
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
    this.actionUrl,
    this.attribute,
    this.channel,
    this.channelId,
    this.type,
  });

  String actionUrl;
  int attribute;
  String channel;
  int channelId;
  int type;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        actionUrl: json["action_url"],
        attribute: json["attribute"],
        channel: json["channel"],
        channelId: json["channel_id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "action_url": actionUrl,
        "attribute": attribute,
        "channel": channel,
        "channel_id": channelId,
        "type": type,
      };
}
