import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class UserServiceApi{
  Future<dynamic> sendLoginData(
      String email,String password)async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/userBlog/signin");

    var response=await client.post(apiUrl,
    headers: <String,String>{
      "Content-Type": "application/json; charset=UTF-8"
    },
      body: jsonEncode(<String,String>{
        "email":email,
        "password":password
      })
    );
    if(response.statusCode==200)
      {
        return json.decode(response.body);
      }
    else
      {
        throw Exception("Failed to send");
      }
  }
  
  Future<dynamic> sendData(
      String name,String age,String address,String mobileNo,String pincode,String email,String password) async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/userBlog/add");

    var response=await client.post(apiUrl,
    headers: <String,String>{
      "Content-Type": "application/json; charset=UTF-8"
    },
    body: jsonEncode(<String,String>{
      "name":name,
      "age":age,
      "address":address,
      "pincode":pincode,
      "mobileNo":mobileNo,
      "email":email,
      "password":password
        })
    );
    if(response.statusCode==200)
      {
        return json.decode(response.body);
      }
    else
      {
        throw Exception("Failed to send data");
      }
  }
}