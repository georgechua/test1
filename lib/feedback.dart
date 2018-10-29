import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';  
import 'dart:async';


class FeedbackForm extends StatefulWidget {
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
  final emailController = TextEditingController();
  final commentsController = TextEditingController();
  
  
  void _addData() {
      Firestore.instance.runTransaction((Transaction transaction) async {
        CollectionReference reference = Firestore.instance.collection('feedback');
        await reference.add ({
            "enquiry_type": selected,
            "name": nameController.text,
            "email": emailController.text,
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
        child: new Text('Content Related'),
        value: 'content_feedback',
    ));
    listDrop.add(new DropdownMenuItem(
        child: new Text('Account Related'),
        value: 'account_feedback',
    )); 
    listDrop.add(new DropdownMenuItem(
        child: new Text('Quiz Related'),
        value: 'quiz_feedback',
    )); 
    listDrop.add(new DropdownMenuItem(
        child: new Text('Others'),
        value: 'others_feedback',
    ));
  }

  

  @override
  Widget build(BuildContext context) {

    loadData();

    return new Scaffold(
      appBar: AppBar(
        title: new Text('Feedback'),
        
      ),
         body: new Column(
            children: <Widget>[
              new Container(
                child: DropdownButtonHideUnderline(
                        child: new DropdownButton(
                          value: selected,
                          items: listDrop,
                          hint: new Text('Enquiry Type', style: new TextStyle(fontFamily: 'Nunito', fontSize: 25.0),),
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
                          labelStyle: TextStyle(fontFamily: 'Nunito',fontSize: 25.0,color: Colors.black54),
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
                                labelStyle: TextStyle(fontFamily: 'Nunito',fontSize: 25.0,color: Colors.black54),
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
                                labelStyle: TextStyle(fontFamily: 'Nunito',fontSize: 25.0,color: Colors.black54),
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
                        height: 40.0,
                        minWidth: 100.0,
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: new Text("Send", style: new TextStyle(fontFamily: 'Nunito', fontSize: 17.0),),
                        onPressed: _addData,
                        splashColor: Colors.lightBlue[900],
                    )
                   
            ],

         ),
    );
  }
}