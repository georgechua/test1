import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../loginpage.dart';
import 'dart:async';
import '../main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';

class ScorePage extends StatefulWidget{
  final int score;
  final int totalQuestion;
  ScorePage(this.score,this.totalQuestion);

  @override
  State createState() => _ScorePageState();
}
class _ScorePageState extends State <ScorePage>{
  //Adding Result to Firebase
  void _addResult() {
    Firestore.instance.runTransaction((Transaction transaction) async {
        CollectionReference reference = Firestore.instance.collection('QuizResult');
        await reference.add ({
            "total_question": widget.totalQuestion,
            "quiz_result": widget.score,
            "user_email": userEmail
         });       
      }) ;
       this.setState(() {
         Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => MyApp()), (Route route) => route == null);
    });
      
  }    

  String userEmail = null;

  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Your Score:", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold,  fontSize: 50.0),),
          new Text(widget.score.toString() + "/" + widget.totalQuestion.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold,  fontSize: 50.0),),
          new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: _addResult,
          ),
          
        new FutureBuilder<FirebaseUser>(
      future: FirebaseAuth.instance.currentUser(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          
         
          userEmail = (snapshot.data.email);
          return new Container();
        }
        else {
          
          return new Text('Loading...', style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold,  fontSize: 30.0),);
        }
      },
    ), 
    
        ],

      )
    );

  }

}
