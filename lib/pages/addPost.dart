import 'package:blogapp/services/postServices.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    String getPost="";
    TextEditingController post=new TextEditingController();

    void SendPost() async{
      SharedPreferences preferences=await SharedPreferences.getInstance();
      String userId=preferences.getString("userId")??"";
      print(post.text);

      final response=await PostApiService().sendPostData(
          userId,
          post.text);
      if(response["status"]=="success")
        {
          print("post add");
        }
      else
        {
          print("error");
        }
    }
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: post,
              decoration: InputDecoration(
                labelText: "Post",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              height: 60,
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                  )
                ),
                onPressed: SendPost,
              child: Text("ADD POST"),),
            ),
            SizedBox(height: 50,),
            SizedBox(
              height: 60,
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                  )
                ),
                onPressed: (){
                Navigator.pop(context);
              },
              child: Text("BACK TO MENU"),),
            )
          ],
        ),
      ),
    );
  }
}
