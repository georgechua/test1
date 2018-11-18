import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';  
import 'dart:async';


class FeedbackForm extends StatefulWidget {
  String currentUser;
  FeedbackForm({Key key, @required this.currentUser}) : super(key:key);
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

enum DialogAction{
  yes,
  no
}

class _FeedbackFormState extends State<FeedbackForm> {
  
  StreamSubscription<DocumentSnapshot> subscription;
  final nameController = TextEditingController();
  final emailController = TextEditingController(text: '';
  final commentsController = TextEditingController();
  
  
  void _addData() {
      Firestore.instance.runTransaction((Transaction transaction) async {
        CollectionReference reference = Firestore.instance.collection('feedback');
        await reference.add ({
            "dateTime": DateTime.now().toUtc(),
            "enquiry_type": selected,
            "name": nameController.text,
            //"email": emailController.text,
            "comments": commentsController.text,
         });
      }) ;
      Navigator.pop(context);
  }

  void dispose() {
    // Clean up the controller when the Widget is disposed
    nameController.dispose();
    emailController.dispose();
    commentsController.dispose();
    super.dispose();
  }


  List<DropdownMenuItem<String>> listDrop = [];
  String selected = null;

  void loadData() {
    listDrop = []; 
    listDrop.add(new DropdownMenuItem(
        child: new Text('Content Related', style: new TextStyle(fontFamily: 'Nunito', fontSize: 25.0,color: Colors.grey[850])),
        value: 'content_feedback',
    ));
    listDrop.add(new DropdownMenuItem(
        child: new Text('Account Related', style: new TextStyle(fontFamily: 'Nunito', fontSize: 25.0,color: Colors.grey[850])),
        value: 'account_feedback',
    )); 
    listDrop.add(new DropdownMenuItem(
        child: new Text('Quiz Related', style: new TextStyle(fontFamily: 'Nunito', fontSize: 25.0,color: Colors.grey[850])),
        value: 'quiz_feedback',
    )); 
    listDrop.add(new DropdownMenuItem(
        child: new Text('Others', style: new TextStyle(fontFamily: 'Nunito', fontSize: 25.0,color: Colors.grey[850])),
        value: 'others_feedback',
    ));
  }

  @override
  Widget build(BuildContext context) {

    loadData();

    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text('Feedback',style: new TextStyle(fontFamily: 'Nunito',color: Colors.grey[850],fontWeight: FontWeight.bold)),
        elevation: 1.0,
      ),
         body: new Column(
            children: <Widget>[
              new Container(
                child: DropdownButtonHideUnderline(
                        child: new DropdownButton(
                          value: selected,
                          items: listDrop,
                          hint: new Text('Enquiry Type', style: new TextStyle(fontFamily: 'Nunito', fontSize: 25.0,color: Colors.grey[850]),),
                          elevation: 20,
                          onChanged: (value) {
                            selected = value;
                                setState(() {} );
                          }
                        )
                      ),
                         padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 20.0),
                  ),
               new Container( 
                 padding: EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
                //padding: EdgeInsets.all(30.0),
                   child: new Column(
                        children: <Widget>[
                          new TextFormField(
                            controller: nameController,
                            autofocus: false,
                        decoration: (new InputDecoration(
                          //counterText: "10",
                          labelText: "Name",
                          //hintText: "Name",
                          labelStyle: TextStyle(fontFamily: 'Nunito',fontSize: 25.0,color: Colors.grey[850]),
                          contentPadding: EdgeInsets.fromLTRB(20.0,30.0,0.0,0.0),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(15.0)
                              )
                        )),
                        keyboardType: TextInputType.text,
                      ),  
                   ],
                ),
              ),
              new Container(
                       child: new Column(
                          children: <Widget>[
                            new TextFormField(
                              controller: emailController,
                              autofocus: false,
                    decoration: (new InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(fontFamily: 'Nunito',fontSize: 25.0,color: Colors.grey[850]),
                                contentPadding: EdgeInsets.fromLTRB(20.0,30.0,20.0,0.0),
                                      border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(15.0)
                            )

                              )),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(20.0,30.0,20.0,0.0),
                     ),
               
                new Container(   // COMMENT INPUT
                       child: new Column(
                          children: <Widget>[
                           
                            new TextField(
                              controller: commentsController,
                              autofocus: false,
                    decoration: (new InputDecoration(
                                labelText: "Comments",
                                labelStyle: TextStyle(fontFamily: 'Nunito',fontSize: 25.0,color: Colors.grey[850]),
                                contentPadding: EdgeInsets.fromLTRB(20.0,30.0,20.0,0.0),
                                      border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(15.0)
                            )

                              )),
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(20.0,30.0,20.0,20.0),

                        
                     ),
                    new MaterialButton(
                        height: 50.0,
                        minWidth: 200.0,
                        color: Colors.orange[800],
                        child: new Text("Send", style: new TextStyle(fontFamily: 'Nunito', fontSize: 25.0,color: Colors.white)),
                        onPressed: _addData,
                        splashColor: Colors.white70,
                    )
            ],
         ),
    );
  }
}