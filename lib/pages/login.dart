import 'package:blogapp/pages/menu.dart';
import 'package:blogapp/pages/register.dart';
import 'package:blogapp/services/userServices.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    String getEmail="",getPass="";
    TextEditingController email=new TextEditingController();
    TextEditingController password=new TextEditingController();

    void SendValues() async{
      // print("Email Id" + email.text);
      // print("Password" + password.text);

      final response=await UserServiceApi().sendLoginData(
          email.text,
          password.text);
      if(response["status"]=="success")
        {
          String userId=response["userdata"]["_id"].toString();
          SharedPreferences preferences=await SharedPreferences.getInstance();
          preferences.setString("userId", userId);
          print("userId:"+userId);
          print("login success");
          Navigator.push(context, MaterialPageRoute(builder:
          (context)=>MenuPage()
          ));
        }
      else if(response["status"]=="invalid user")
        {
          print("incorrect mail id");
        }
      else
        {
          print("incorrect password");
        }
    }
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: "Email Id",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
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
                onPressed: SendValues,
              child: Text("LOGIN"),),
            ),
            SizedBox(height: 20,),
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
                  Navigator.push(context, MaterialPageRoute(builder:
                  (context)=>RegisterPage()
                  ));
                },
              child: Text("New User?"),),
            )
          ],
        ),
      ),
    );
  }
}
