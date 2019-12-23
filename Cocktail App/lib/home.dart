import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice/drink_detail.dart';
import 'package:practice/main.dart';

class home extends StatefulWidget{
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  var myApi="https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=cocktail";
  var res,drinks;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData()async{
    res=await http.get(myApi);
    drinks=jsonDecode(res.body)["drinks"];
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(
          colors: [myColor,Colors.orange]
      )),
      child: Scaffold(
        backgroundColor:Colors.transparent,//gives chat/roof
        appBar: AppBar(
          title: Center(child: Text("Cocktail App")),
          backgroundColor:Colors.transparent,
          elevation: 0.0,
        ),
          body: Center(
         // child: Text("India Wale",textAlign: TextAlign.center,),
          child:res!=null?
          ListView.builder(
//        GridView.builder(
//          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: drinks.length,
              itemBuilder:(context,index){
              var drink=drinks[index];
            return ListTile(
              leading: Hero(
                tag: drink["idDrink"],
                child: CircleAvatar(backgroundImage: NetworkImage(drink["strDrinkThumb"]??"https://previews.123rf.com/images/pavelstasevich/pavelstasevich1811/pavelstasevich181101032/112815935-no-image-available-icon-flat-vector-illustration.jpg",
                ),
                ),
              ),
              title: Text("${drink["strDrink"]}",style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),),
              subtitle:Text("${drink["idDrink"]}",style: TextStyle(
              color: Colors.white,
            ),),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>DrinkDetial(drink:drink),
                //fullscreenDialog: true
                ));
              },
            );
          },
          ):CircularProgressIndicator(),
      ),
      ),
    );
  }
}


//@override
//Widget build(BuildContext context) {
//  return Container(
//    color: Colors.orange,
//    child: Center(child: Text("Hello World")),
//  );
//}
//class home extends StatefulWidget{
//  @override
//  _homeState createState() => _homeState();
//}
//
//class _homeState extends State<home> {
//  var myText="India Wale";
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.purple,//gives chat/roof
//      appBar: AppBar(
//        title: Center(child: Text("Cocktail App")),
//        elevation: 0.0,
//      ),
//      body: Center(
//        // child: Text("India Wale",textAlign: TextAlign.center,),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Image.network("https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png",
//              height: 100.0,width: 100.0,fit: BoxFit.contain,),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text(myText,textAlign: TextAlign.center,textScaleFactor: 2.0,),
//                SizedBox(
////              height: 50.0,
//                  width: 50.0,
//                ),
//                RaisedButton(
//                  color: Colors.white,
//                  onPressed: (){
//                    myText="Hindustani";
//                    setState(() {
//
//                    });
//                  },
//                  child: Text("Press Me!"),
//                )
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
