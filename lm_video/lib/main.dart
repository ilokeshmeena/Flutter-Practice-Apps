import 'package:flutter/material.dart';
import 'package:lm_video/home.dart';
void main(){
  runApp(MyApp());
  }
  
  class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
theme: ThemeData(
  primaryColor: Colors.red,
),
home: Home(),
);
  }


}