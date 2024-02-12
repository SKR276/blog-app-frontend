import 'package:blogapp/services/userServices.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    String getname="",getage="",getaddress="",getpincode="",getphnno="",getemail="",getpass="";
    TextEditingController name=new TextEditingController();
    TextEditingController age=new TextEditingController();
    TextEditingController address=new TextEditingController();
    TextEditingController pincode=new TextEditingController();
    TextEditingController mobileNo=new TextEditingController();
    TextEditingController email=new TextEditingController();
    TextEditingController password=new TextEditingController();

    void SendValues() async{
      // print("Name" + name.text);
      // print("Address" + address.text);
      // print("Age" + age.text);
      // print("Pincode" + pincode.text);
      // print("Mobile No" + mobileNo.text);
      // print("Email Id" + email.text);
      // print("Password" + password.text);

      final response=await UserServiceApi().sendData(
          name.text,
          age.text,
          address.text,
          mobileNo.text,
          pincode.text,
          email.text,
          password.text);

      if(response["status"]=="success")
        {
          print("register success");
        }
      else
        {
          print("error");
        }
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: age,
                decoration: InputDecoration(
                    labelText: "Age",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: address,
                decoration: InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: pincode,
                decoration: InputDecoration(
                    labelText: "Pincode",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: mobileNo,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    labelText: "Email Id",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: password,
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
                child: Text("Register"),),
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
                    Navigator.pop(context);
                  },
                  child: Text("Back to login"),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
