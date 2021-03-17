// To parse this JSON data, do
//
//     final typeGetListAdvResponse = typeGetListAdvResponseFromJson(jsonString);

import 'dart:convert';

TypeGetListAdvResponse typeGetListAdvResponseFromJson(String str) =>
    TypeGetListAdvResponse.fromJson(json.decode(str));

String typeGetListAdvResponseToJson(TypeGetListAdvResponse data) =>
    json.encode(data.toJson());

class TypeGetListAdvResponse {
  TypeGetListAdvResponse({
    this.data,
    this.message,
    this.status,
  });

  Data data;
  String message;
  int status;

  factory TypeGetListAdvResponse.fromJson(Map<String, dynamic> json) =>
      TypeGetListAdvResponse(
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
    this.bannerAdList,
    this.newsFlowAdList,
  });

  List<dynamic> bannerAdList;
  List<dynamic> newsFlowAdList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bannerAdList: List<dynamic>.from(json["banner_ad_list"].map((x) => x)),
        newsFlowAdList:
            List<dynamic>.from(json["news_flow_ad_list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "banner_ad_list": List<dynamic>.from(bannerAdList.map((x) => x)),
        "news_flow_ad_list": List<dynamic>.from(newsFlowAdList.map((x) => x)),
      };
}
