import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:lokesh/User_Menu.dart';
import 'package:lokesh/home.dart';
class Users extends StatefulWidget {
   final userId,userImage;
  const Users({Key key, this.userId,this.userImage}) : super(key: key);
  @override
  _UsersState createState() => _UsersState(userId,userImage);
}

class _UsersState extends State<Users> {
  final userId,userImage;
  _UsersState(this.userId,this.userImage);
  @override
  Widget build(BuildContext context) {
    var usera=userId["address"];
    return Scaffold(
        appBar:AppBar(
          title: Text("Users"),
        ) ,
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(accountName: Text("Lokesh Meena"), accountEmail: Text("Lokesh@lokesh.in"),
              currentAccountPicture: CircleAvatar(backgroundColor: Colors.black,child: Text("L"),)),

              new ListTile(
                title: Text("Page 1"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>home(),));
                },
              ),
              Divider(),
              new ListTile(
                title: Text("Page 2"),
              ),
              Divider(),
              new ListTile(
                title: Text("Close"),
              ),
              Divider(),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(userImage)
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("User Name:- ${userId["username"]}",textScaleFactor: 1.5,),
                SizedBox(
                  height: 2.0,
                ),
                Text("Name:- ${userId["name"]}",textScaleFactor: 1.6,),
                SizedBox(
                  height: 2.0,
                ),
                Text("Email:- ${userId["email"]}",textScaleFactor: 1.6,),
                SizedBox(
                  height: 2.0,
                ),
                 Text("Address:- ${usera["suite"]}, ${usera["street"]}, ${usera["city"]}-${usera["zipcode"]}",textScaleFactor: 1.7,),
                SizedBox(
                  height: 2.0,
                ),
                Text("Mobile:- ${userId["phone"]}",textScaleFactor: 1.6,),
                SizedBox(
                  height: 2.0,
                ),
                Text("Website:- ${userId["website"]}",textScaleFactor: 1.6,),
                SizedBox(
                  height: 2.0,
                ),
                Text("Company Details:-",textScaleFactor: 1.6,),
                SizedBox(
                  height: 2.0,
                ),
                TextBox()
              ],
            ),
          ],
        )
    );
  }
}