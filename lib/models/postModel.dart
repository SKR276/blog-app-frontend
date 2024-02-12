// To parse this JSON data, do
//
//     final viewList = viewListFromJson(jsonString);

import 'dart:convert';

List<ViewList> viewListFromJson(String str) => List<ViewList>.from(json.decode(str).map((x) => ViewList.fromJson(x)));

String viewListToJson(List<ViewList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewList {
  String userId;
  String post;

  ViewList({
    required this.userId,
    required this.post,
  });

  factory ViewList.fromJson(Map<String, dynamic> json) => ViewList(
    userId: json["userId"],
    post: json["post"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "post": post,
  };
}
