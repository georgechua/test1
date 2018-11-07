import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BankContent extends StatefulWidget {
  @override
  _BankContentState createState() => _BankContentState();
}

class _BankContentState extends State<BankContent> {

@override
CollectionReference cRef = Firestore.instance.collection('Content').document('Banking').collection('bankcontent');
  String getTitle = '';
  String getContent ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        elevation: 1.0,
        title: new Text("BANKING 101",style: new TextStyle(fontFamily: 'Nunito',color: Colors.grey[850],fontWeight: FontWeight.bold),),
      ),
         body:  StreamBuilder<QuerySnapshot>(
            stream: cRef.snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return new Text('No Data Found!');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting: return new Text('Loading...');
                default:
                
                  return new ListView(
                    children: snapshot.data.documents.map((DocumentSnapshot document)
                     {
                   return new GestureDetector(
                     
                    child: new Card(
                      
                        color: Colors.red[900],
                        margin: EdgeInsets.symmetric(horizontal: 30.0,vertical: 15.0),
                        elevation: 10.0,
                     child: new Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      
                      new Container(
                        padding: new EdgeInsets.all(15.0),
                        child: new Column(
                           
                          children: <Widget>[
                  
                              new ListTile( 
                                  
                              title: new Text(document['title'], style: new TextStyle(fontSize:30.0, fontFamily: 'Nunito', fontWeight: FontWeight.bold,color: Colors.grey[900]),),
                              subtitle: new Text(document['desc'],textAlign: TextAlign.justify, style: new TextStyle(fontSize:18.0, fontFamily: 'Nunito', fontWeight: FontWeight.normal,color: Colors.pink[50]),),
                              
                              ),
                              
                        ],
                         
                      ),
                      
                     ),
                    ],  
                  )
                  
                ),
                onTap: () {
                 showDialog(
                      barrierDismissible: false,
                      context:context,
                      child: new SimpleDialog(
                        
                        title: new Text(document['title'],style: new TextStyle(fontFamily: 'Nunito',color: Colors.grey[850],fontWeight: FontWeight.bold),),
                          contentPadding: EdgeInsets.symmetric(horizontal:30.0,vertical:20.0),
                          
                          children: <Widget>[
                            new Container(
                              width: 3000.0,
                              child: new Text(document['content'],textAlign: TextAlign.justify, style: new TextStyle(fontFamily: 'Nunito',fontSize: 17.0,color: Colors.grey[850]),), 
                            ),
                            new FlatButton(
                              child:  new Icon(Icons.close),
                                onPressed: () => Navigator.of(context,rootNavigator:true).pop(),
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
