import 'package:flutter/material.dart';

class Success extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Success"),
      ),
      body: Center(
        child: Container(
          height: 100.0,
          width: 200.0,
          child: Text("Success"),
        ),
      )
      ,
    );
  }

}