import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lokesh/main.dart';
import 'package:lokesh/Users.dart';
import 'package:http/http.dart' as http;
class home extends StatefulWidget{
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  var usersApiUrl="https://jsonplaceholder.typicode.com/users";
  var users,res;
  @override
  void initState() {
    super.initState();
    fecthUsers();
  }
  void fecthUsers()async{
    res=await http.get(usersApiUrl);
    users=jsonDecode(res.body);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text("Home"),
        ) ,
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(accountName: Text("Lokesh Meena"), accountEmail: Text("Lokesh@lokesh.in"),
                  currentAccountPicture: CircleAvatar(backgroundColor: Colors.black,child: Text("L"),)),

              new ListTile(
                title: Text("Page 1"),
              ),
              Divider(),
              new ListTile(
                title: Text("Page 2"),
              ),
              Divider(),
              new ListTile(
                title: Text("Close"),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              Divider(),
            ],
          ),
        ),
      body: Center(
        child: users!=null?ListView.builder(itemCount: users.length,
            itemBuilder: (context,index){
          var user=users[index];
          var image="https://picsum.photos/200/300?random=${Random().nextInt(5)}";
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(image,),
            ),
            title: Text("${user["name"]}",style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),),
            subtitle: Text("${user["username"]}",style: TextStyle(
              color: Colors.purple,
              fontSize: 15,
            ),),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Users(userId:user,userImage: image,),));
            },
          );
            }):CircularProgressIndicator(),
      )
    );
  }
  
}