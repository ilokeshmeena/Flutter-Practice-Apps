import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_extractor/youtube_extractor.dart';
import 'package:media_player/media_player.dart';
import 'package:media_player/data_sources.dart';
import 'package:media_player/ui.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MediaPlayer mePlayer;
  var extractor = YouTubeExtractor();
  final textControllerKeywords=TextEditingController();
  var searchKeyword,searchResult,searchData;
  var musicLink="";
  bool isSearching=false,showResults=false,isClickedKeyboardSearch=false;
  void getMusicLink(String videoId) async{
    var audioInfo = await extractor.getMediaStreamsAsync(videoId);
    musicLink=audioInfo.audio.first.url;
    setState(() {

    });

  }
  void fetchSearch() async{
      searchResult=await http.get("https://api.w3hills.com/youtube/search?api_key=0B309769-259B-E40C-0D0E-6DAB2354C322&keyword=${searchKeyword}");
      searchData=jsonDecode(searchResult.body)["videos"];
      setState(() {
        this.showResults=true;
      });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:!isSearching?Text("LM Music"):TextFormField(
          textInputAction: TextInputAction.search,
            onFieldSubmitted: (text){
            fetchSearch();
            this.isSearching=!this.isSearching;
            setState(() {
            });
            },
          onChanged: (newText){
            setState(() {
              searchKeyword=newText;
            });
          },
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Colors.black,
            ),
            hintText:"Enter Song Name",
          ),
        ),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.search),onPressed: (){
            if(isSearching){
                  fetchSearch();
                  this.isSearching=!this.isSearching;
                  setState(() {
                  });
            }else{
              this.isSearching=!this.isSearching;
              setState(() {
              });
            }
          },)
        ],
      ),
      drawer:Drawer(),
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
        child:showResults? ListView.builder(itemCount: searchData.length,itemBuilder: (context,index){
          var videoDetails=searchData[index];
         return Card(
           child: ListTile(
             leading: CircleAvatar(
               backgroundImage: NetworkImage("${videoDetails["thumbnail"]}"),
             ),
            title: Text("${videoDetails["title"]}"),
            subtitle: Text("Duration:- ${videoDetails["duration"]}"),
             onTap:(){
               getMusicLink(videoDetails["id"]);
                setState(() {
                });
             },
            ),
         );
        }):Container(
          alignment:Alignment.center,
          child: Text("Search Song You Want To Listen 🙃"),
        ),

      ),
      Container(
        alignment: (Alignment.bottomCenter),
        child: Row(
//          mainAxisAlignment: MainAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Text(musicLink),
          CircleAvatar(
        ),
        SizedBox(
          width: 10,
        ),
        CircleAvatar(
        backgroundColor: Colors.black,
        ),
        CircleAvatar(
        backgroundColor: Colors.black,
        )
        ],
      ),
      )
      ],

    )
    );
  }
}



