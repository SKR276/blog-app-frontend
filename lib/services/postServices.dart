import 'dart:convert';

import 'package:http/http.dart' as http;

class PostApiService{
  Future<dynamic> sendPostData(String userId,String post)async{
    var client=http.Client();
    var apiUrl=Uri.parse("http://172.16.185.196:3001/api/post/add_post");
    var response=await client.post(apiUrl,
    headers: <String,String>{
      "Content-Type": "application/json; charset=UTF-8"
    },
      body: jsonEncode(<String,String>{
        "userId":userId,
        "post":post
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
}