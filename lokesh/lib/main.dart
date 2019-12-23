import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lokesh/home.dart';
import 'package:lokesh/Users.dart';

const myAppMainColor=Colors.red;
const myAppSecondaryColor=Colors.orange;

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:TargetPlatform==TargetPlatform.android?myAppMainColor: Colors.white,
      ),
    home: home(),
    );
  }
}