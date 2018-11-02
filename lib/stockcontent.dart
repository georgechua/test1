import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'auth.dart';

class StockContent extends StatefulWidget {


  @override
  _StockContentState createState() => _StockContentState();
}

class _StockContentState extends State<StockContent> {

CollectionReference cRef = Firestore.instance.collection('Content').document('Stock').collection('stockcontent');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("STOCK 101"),
      ),
      //backgroundColor: Colors.black87,
         body:  StreamBuilder<QuerySnapshot>(
            stream: cRef.snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return new Text('No Data Found!');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting: return new Text('Loading...');
                default:
                  return new ListView(
                    children: snapshot.data.documents.map((DocumentSnapshot document) {
                   return new GestureDetector(
                    child: new Card(
                        margin: EdgeInsets.all(10.0),
                        elevation: 5.0,
                     child: new Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                        new ListTile(
                          contentPadding: EdgeInsets.all(25.0),
                          title: new Text(document['title'], style: new TextStyle(fontSize:30.0, fontFamily: 'Nunito', fontWeight: FontWeight.bold,color: Colors.grey[850]),),
                          subtitle: new Text(document['desc'], style: new TextStyle(fontSize:18.0, fontFamily: 'Nunito', fontWeight: FontWeight.normal,color: Colors.grey[850]),),
                          
                        ),
                    ],  
                  )
                ),
                onTap: (){
                 showDialog(
                      barrierDismissible: false,
                      context:context,
                      child: new SimpleDialog(
                        
                        title: new Text(document['title']),
                          contentPadding: EdgeInsets.symmetric(horizontal:20.0,vertical:10.0),
                          
                          children: <Widget>[
                            new Container(
                              width: 3000.0,
                              child: new Text(document['content'], style: new TextStyle(fontFamily: 'Nunito',fontSize: 20.0,color: Colors.grey[850]),), 
                            ),
                            new FlatButton(
                              child:  new Icon(Icons.close),
                                onPressed: () => Navigator.pop(context),
                            ),
                            
                          ],
                        )
                      );
                }
                );
            }).toList(),
          );
        }
        
      },
    ),
    );
  }
}
