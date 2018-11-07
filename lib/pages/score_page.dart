import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
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
  
  String formattedDate = DateFormat('dd-MM-yyyy EEE – kk:mm:ss').format(DateTime.now().add(new Duration(hours:8)));
  
  //Adding Result to Firebase
  void _addResult() {
    var docRef = Firestore.instance.collection('QuizResult');
   
    Firestore.instance.runTransaction((Transaction transaction) async {
        CollectionReference reference = docRef;
        await reference.add ({
            "total_question": widget.totalQuestion,
            "quiz_result": widget.score,
            "user_email": userEmail,
            "dateTime": formattedDate
         });       
      }) ;
       this.setState(() {
         Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => MyApp()), (Route route) => route == null);
    });
      
  }    

  String userEmail = null;

  @override
  Widget build(BuildContext context){
    return new WillPopScope(
      onWillPop: () async => false,
    child: new Material(
      color: Colors.orange[800],
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Your Score:", style: new TextStyle(color: Colors.white, fontFamily: 'Nunito', fontWeight: FontWeight.bold,  fontSize: 50.0),),
          new Text(widget.score.toString() + " / " + widget.totalQuestion.toString(), style: new TextStyle(fontFamily:'Nunito', color: Colors.white, fontWeight: FontWeight.bold,  fontSize: 50.0),),
          new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 90.0,
            onPressed: _addResult,
          ),
          
        new FutureBuilder<FirebaseUser>(
      future: FirebaseAuth.instance.currentUser(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          userEmail = (snapshot.data.email);
          return new Container();
        }
      },
    ), 
   ],

      )
    )
    );

  }

}
