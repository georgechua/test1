import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'auth.dart';

class ResultPage extends StatefulWidget {
  ResultPage({this.auth});
  final BaseAuth auth;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('Overall Result',style: new TextStyle(fontFamily: 'Nunito',fontWeight: FontWeight.bold,color: Colors.grey[850]),),
      ),
     body: new FutureBuilder<FirebaseUser>(
                future: FirebaseAuth.instance.currentUser(),
                builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                   return new StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('QuizResult').where("user_email",isEqualTo: snapshot.data.email).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return new Center(
                  child: new Text('No Data Found!',
                    style: new TextStyle(fontSize: 40.0,fontFamily: 'Nunito'),
                    )
                  );
              switch (snapshot.connectionState) {
                case ConnectionState.waiting: return new Center(child:Text('Loading...',style: new TextStyle(fontSize: 40.0,fontFamily: 'Nunito'),));
                default:
                  return new ListView(
                    
                    children: snapshot.data.documents.map((DocumentSnapshot document) {
                 return new Card(
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                    color: Colors.orange[800],
                    margin: EdgeInsets.symmetric(vertical:8.0,horizontal: 50.0),
                    elevation: 15.0,
                     child: new Column( 
                        
                        children: <Widget>[
                          
                          new Padding(
                            padding: new EdgeInsets.all(0.0),
                            child: new Row(
                              children: <Widget>[
                             new Container(
                               padding: EdgeInsets.symmetric(horizontal:100.0),
                               child: new Row(
                                 children: <Widget>[
                                   new Text(document['quiz_result'].toString(),style: new TextStyle(color: Colors.white,fontSize: 85.0,fontFamily: 'Nunito',fontStyle: FontStyle.italic)),
                                    new Text(' |',style: new TextStyle(color: Colors.white,fontSize: 45.0,fontFamily: 'Nunito')),
                                    new Text(document['total_question'].toString(),style: new TextStyle(color: Colors.white,fontSize: 40.0,fontFamily: 'Nunito',fontStyle: FontStyle.italic))
                                 ],
                               ),    
                          ),
                        ], 
                      ),
                    ),
                  new Padding(
                    padding: new EdgeInsets.all(0.0),
                    child: new Row(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.fromLTRB(60.0,0.0,0.0,15.0),
                          child: new Text(document['dateTime'],style: new TextStyle(color: Colors.white, fontSize: 18.0,fontFamily: 'Nunito')),
                          )
                        ],  
                      )
                    ),
                  
                  ],
                )

              );
            }).toList(),
          );
        }
      },
    );
       }
     else {
           return new Text('Loading...');
          }
        },
      ),
    );
  }
}

