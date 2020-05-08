
import 'dart:async';
import 'package:flutter/material.dart';
import'package:video_player/video_player.dart';

void main ()=> runApp ( Home());
class Home extends StatefulWidget{
   @override
_HomePageState createState() =>_HomePageState(); }

class _HomePageState extends State<Home>{
VideoPlayerController _controller ; 
String screentext = "";
String screensubtext = ""; 
Timer timer ;
int pos =0; 
List <String>screentextlist = ["Partager votre localisation avec vos proches " , "Communiquer facilement avec des notifications intelligentes ", "Organiser vos voyages facilement "   ] ;
List <String> screensubtextlist =["Avez-vous déja un compte?se connecter"];

void iniState(){
   super.initState();
  _controller = VideoPlayerController.asset('assets/video.mp4')
     ..initialize().then((_){setState(() {} );
    
  _controller.play(); 
  _controller.setLooping(true); 
  _controller.setVolume(0.0);
     });
  Timer.periodic(Duration(seconds:7),(Timer t){setState(()  {
  screentext= screentextlist[pos];
  screensubtext=screensubtextlist[pos];
  pos++; 
 });
 });
  }
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'video', 
      home:Scaffold(
        body:Stack(fit: StackFit.expand, 
        children: <Widget>[  
          Container(
            child: _controller.value.initialized
           ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio, 
            child: VideoPlayer(_controller),
            )
         : Container(), 
          ), 
          Column( 
          mainAxisAlignment:  MainAxisAlignment.end, 
          children: <Widget>[
             Padding(
               padding: EdgeInsets.only(left:16.0,right:16.0),
               child:Container(child:Text(screentext,style:TextStyle(color:Colors.white,fontSize:20.0),),),
             ),
Padding(
               padding: EdgeInsets.only(left:16.0,right:16.0),
               child:Container(child:Text(screensubtext,style:TextStyle(color:Colors.white,fontSize:16.0),),),
             ),
       SizedBox(height:20.0),
          
      Padding(
               padding: EdgeInsets.only(left:16.0,right:16.0),
               child:Container(
                 width: MediaQuery.of(context).size.width,
                 child: RaisedButton(
                   shape:RoundedRectangleBorder(
                     borderRadius:new BorderRadius.circular(30.0)),
                     child: Text("Commencer"),
                     onPressed:(){},
                     color:Color(0xff222327),
                     textColor:Colors.white,
                     padding: EdgeInsets.fromLTRB(
                      10 , 10, 10, 10),
                      splashColor: Colors.orange,

                   )
                 ),
 ),
          

          ],
            
          ),
        ],  
        )
      ),
    );
                 
      
  }



  
  }





