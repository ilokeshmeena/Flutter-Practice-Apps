import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
appBar: AppBar(
  title: Text("Home"),
),
drawer: Drawer(

),
body: Container(
  child: Text(
    "hello"
  ),
),
    );
  }

}