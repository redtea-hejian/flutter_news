import 'dart:convert';

import 'package:flutter/foundation.dart';

// 请求
UserLoginReq userLoginReqFromJson(String str) =>
    UserLoginReq.fromJson(json.decode(str));

String userLoginReqToJson(UserLoginReq data) => json.encode(data.toJson());

class UserLoginReq {
  UserLoginReq({
    @required this.email,
    @required this.password,
  });

  String email;
  String password;

  factory UserLoginReq.fromJson(Map<String, dynamic> json) => UserLoginReq(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

// 响应
UserLoginRes userLoginResFromJson(String str) =>
    UserLoginRes.fromJson(json.decode(str));

String userLoginResToJson(UserLoginRes data) => json.encode(data.toJson());

class UserLoginRes {
  UserLoginRes({
    this.accessToken,
    this.displayName,
    this.channels,
  });

  String accessToken;
  String displayName;
  List<String> channels;

  factory UserLoginRes.fromJson(Map<String, dynamic> json) => UserLoginRes(
        accessToken: json["accessToken"],
        displayName: json["displayName"],
        channels: List<String>.from(json["channels"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "displayName": displayName,
        "channels": List<dynamic>.from(channels.map((x) => x)),
      };
}
