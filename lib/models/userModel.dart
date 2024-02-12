// To parse this JSON data, do
//
//     final viewList = viewListFromJson(jsonString);

import 'dart:convert';

List<ViewList> viewListFromJson(String str) => List<ViewList>.from(json.decode(str).map((x) => ViewList.fromJson(x)));

String viewListToJson(List<ViewList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewList {
  String name;
  String age;
  String address;
  String mobileNo;
  String pincode;
  String email;
  String password;

  ViewList({
    required this.name,
    required this.age,
    required this.address,
    required this.mobileNo,
    required this.pincode,
    required this.email,
    required this.password,
  });

  factory ViewList.fromJson(Map<String, dynamic> json) => ViewList(
    name: json["name"],
    age: json["age"],
    address: json["address"],
    mobileNo: json["mobileNo"],
    pincode: json["pincode"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "address": address,
    "mobileNo": mobileNo,
    "pincode": pincode,
    "email": email,
    "password": password,
  };
}
