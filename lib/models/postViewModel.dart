// To parse this JSON data, do
//
//     final viewList = viewListFromJson(jsonString);

import 'dart:convert';

List<ViewList> viewListFromJson(String str) => List<ViewList>.from(json.decode(str).map((x) => ViewList.fromJson(x)));

String viewListToJson(List<ViewList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewList {
  UserId userId;
  String post;
  DateTime postDate;

  ViewList({
    required this.userId,
    required this.post,
    required this.postDate,
  });

  factory ViewList.fromJson(Map<String, dynamic> json) => ViewList(
    userId: UserId.fromJson(json["userId"]),
    post: json["post"],
    postDate: DateTime.parse(json["postDate"]),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId.toJson(),
    "post": post,
    "postDate": postDate.toIso8601String(),
  };
}

class UserId {
  String name;
  String age;
  String address;
  String mobileNo;

  UserId({
    required this.name,
    required this.age,
    required this.address,
    required this.mobileNo,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    name: json["name"],
    age: json["age"],
    address: json["address"],
    mobileNo: json["mobileNo"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "address": address,
    "mobileNo": mobileNo,
  };
}
