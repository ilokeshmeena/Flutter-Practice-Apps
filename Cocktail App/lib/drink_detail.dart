import 'package:flutter/material.dart';
import 'package:practice/main.dart';
class DrinkDetial extends StatelessWidget {
  final drink;

  const DrinkDetial({Key key, @required this.drink}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(
          colors: [myColor,Colors.orange]
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
       appBar: AppBar(
         backgroundColor: Colors.transparent,
         title: Text(drink["strDrink"]),
       ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          Hero(
            tag: drink["idDrink"],
            child: CircleAvatar(
              radius:100.0
              ,backgroundImage: NetworkImage(drink["strDrinkThumb"],
            ),
            ),
          ),
        SizedBox(height: 30.0,),
        Text("ID:-${drink["idDrink"]}",style: TextStyle(
          color: Colors.white,
        ),),
        SizedBox(height: 30.0,),
        Text("${drink["strDrink"]}",style: TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),),
      ],
          ),
        ),
      ),
    );
  }
}