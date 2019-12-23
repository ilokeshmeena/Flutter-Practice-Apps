import 'dart:convert';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/success.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var res,data,status="";
  var name="";
  var password="";
  var email="";
  var username="";
  final textControllername=TextEditingController();
  final textControllerUsername=TextEditingController();
  final textControllerPassword=TextEditingController();
  final textControllerEmail=TextEditingController();
  void singUpApi()async {
    res =await http.get(
        "http://clearcode.xyz/api/register.php?username=${username}&password=${password}&name=${name}&email=${email}");
    data = jsonDecode(res.body);
    print(data);
    status = data["status"];
    print(status);
    if (status.toString().endsWith("successfully")) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Success()));
    }else{
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                  onChanged: (newText) {
                     setState(() {});
                    name = newText;
                  },
                  keyboardType: TextInputType.text,
                  controller: textControllername,
                  decoration: InputDecoration(
                    hintText: "Enter Name",
                    labelText: "Name",

                  )
              ),
              TextField(
                  controller: textControllerUsername,
                  onChanged: (newText) {
                     setState(() {});
                    username = newText;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",

                  )
              ),
              TextField(
                  controller: textControllerEmail,
                  onChanged: (newText) {
                    setState(() {});
                    email = newText;
                  },
                  keyboardType:TextInputType.emailAddress ,
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    labelText: "Email",

                  )
              ),
              TextField(
                  controller: textControllerPassword,
                  onChanged: (newText) {
                    setState(() {});
                    password = newText;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",

                  )
              ),
              RaisedButton(
                  color: Colors.cyanAccent,
                  child: Text("Sing Up"),
                  onPressed: () {
                      singUpApi();
                  }
              ),
              SizedBox(height: 50,),
              Text(status),
            ],
          ),
        ),
      ),
    );
  }
}
