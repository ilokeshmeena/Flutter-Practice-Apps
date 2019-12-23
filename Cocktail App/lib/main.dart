import 'package:flutter/material.dart';
import 'package:practice/home.dart';
const Color myColor=Colors.red;
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hello",
      theme: ThemeData(
        primarySwatch:myColor,
        primaryColor: myColor,
      ),
      home: home(),
    );
  }
}