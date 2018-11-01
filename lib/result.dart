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

void _getUser() async {
  String email = '';
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  email = user.email;
  
}

class _ResultPageState extends State<ResultPage> {
 String user = '';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Result Page'),
      ),
body:  StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('QuizResult').where("user_email",isEqualTo: 'george@test.com').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return new Center(child: new Text('No Data Found!',style: new TextStyle(fontSize: 40.0,fontFamily: 'Nunito'),));
              switch (snapshot.connectionState) {
                case ConnectionState.waiting: return new Center(child:Text('Loading...',style: new TextStyle(fontSize: 40.0,fontFamily: 'Nunito'),));
                default:
                
                  return new ListView(
                    children: snapshot.data.documents.map((DocumentSnapshot document) {

                 return new Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0),
                        elevation: 5.0,
                     child: new Column(
                    //mainAxisSize: MainAxisSize.min,
                    
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.all(0.0),
                        child: new Row(
                            children: <Widget>[
                    
                             new Container(
                               padding: EdgeInsets.symmetric(horizontal:130.0),
                               child: new Row(
                                 children: <Widget>[
                                   new Text(document['quiz_result'].toString(),style: new TextStyle(fontSize: 80.0)),
                                    new Text('/',style: new TextStyle(fontSize: 60.0)),
                                    new Text(document['total_question'].toString(),style: new TextStyle(fontSize: 80.0))
                                 ],
                               ),    
                          ),
                        ], 
                      ),
                    ),
                      new Padding(
                          padding: new EdgeInsets.all(2.0),

                          child: new Row(
                            children: <Widget>[
                      
                             new Padding(
                               padding: new EdgeInsets.all(7.0),
                               child: new Text(document['dateTime'],style: new TextStyle(fontSize: 18.0)),
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
    ),
    );
  }
}
