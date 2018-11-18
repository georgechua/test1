import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//pages
import '../result.dart';
import '../bankcontent.dart';
import '../financecontent.dart';
import '../investcontent.dart';
import '../economicscontent.dart';
import '../feedback.dart';
import '../pages/landing.dart';
import '../auth.dart';
import '../questionnaires.dart';
import '../aboutus.dart';
import '../calcLanding.dart';
import '../riskprofile.dart';

class MyHomePage extends StatelessWidget {

  MyHomePage({this.auth, this.onSignedOut,this.cuser,this.email});
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String cuser;
  final String email;

 void _signOut() async{
   try{
        await auth.signOut();
        onSignedOut();
    }catch(e){
        print(e);
    } 
}

  String getEmail = null;

  @override
  Widget build(BuildContext context) {
      
    return new Scaffold(
      appBar: new AppBar(
      title: new Text('Home',style: new TextStyle(color: Colors.grey[850],fontFamily:'Nunito',fontWeight: FontWeight.bold),),
      centerTitle: true,
      elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      actions: <Widget>[
        new FlatButton(
          child: new Icon(Icons.exit_to_app,color: Colors.grey[850],size: 30.0,),
          padding: EdgeInsets.only(left:30.0),
          onPressed: _signOut,
          
        ),
         
      ],
      
    ),
      drawer: new Drawer(
        elevation: 20.0,
        child: ListView(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.fromLTRB(30.0,50.0,40.0,10.0),
                child: new Text('FINEDUBOT',style: new TextStyle(fontSize:30.0, fontFamily:'Nunito',fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.grey[850])),
            ),
            new Container(
              padding: EdgeInsets.fromLTRB(32.0,0.0,40.0,40.0),
                child: new Text("$cuser",style: new TextStyle(fontSize:18.0, fontFamily:'Nunito',fontWeight: FontWeight.bold,fontStyle: FontStyle.normal,color: Colors.grey[850])),
            ),
            
           new ListTile(
             leading: new Icon(Icons.grade),
             contentPadding: new EdgeInsets.symmetric(horizontal: 40.0),
             title: new Text('Quiz',style: new TextStyle(fontFamily: 'Nunito', fontSize: 20.0, color: Colors.grey[850]),),
             onTap: () {
               Navigator.of(context).pop();
               Navigator.of(context).push(new MaterialPageRoute(
                 builder: (BuildContext context) => new Landing()) 
               );
             },
           ),
           new ListTile(
             leading: new Icon(Icons.question_answer),
             contentPadding: new EdgeInsets.symmetric(horizontal: 40.0),
             title: new Text("Result",style: new TextStyle(fontFamily: 'Nunito', fontSize: 20.0, color: Colors.grey[850]),),
             onTap: () {
               Navigator.of(context).pop();
               Navigator.of(context).push(new MaterialPageRoute(
                 builder: (BuildContext context) => new ResultPage()
               ));
             },
           ),
           new ListTile(
             leading: new Icon(Icons.person),
             contentPadding: new EdgeInsets.symmetric(horizontal: 40.0),
             title: new Text('Risk Profile',style: new TextStyle(fontFamily: 'Nunito', fontSize: 20.0, color: Colors.grey[850]),),
             onTap: () {
               Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                builder : (BuildContext context) => new RiskProfile()
              ));
             },
           ),
           new ListTile(
             leading: new Icon(Icons.apps),
             contentPadding: new EdgeInsets.symmetric(horizontal: 40.0),
             title: new Text('Loan Calculators',style: new TextStyle(fontFamily: 'Nunito', fontSize: 20.0, color: Colors.grey[850]),),
             onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                builder : (BuildContext context) => new CalcLanding()
                
              ));
             },
           ),
           new ListTile(
             leading: new Icon(Icons.note_add),
             contentPadding: new EdgeInsets.symmetric(horizontal: 40.0),
             title: new Text('Survey',style: new TextStyle(fontFamily: 'Nunito', fontSize: 20.0, color: Colors.grey[850]),),
             onTap: () {
               Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                builder : (BuildContext context) => new Questionnaires()
              ));
             },
           ),
           new Divider(
             height: 1.0,
           ),
           new ListTile(
             leading: new Icon(Icons.feedback),
             contentPadding: new EdgeInsets.symmetric(horizontal: 40.0),
             title: new Text('Feedback',style: new TextStyle(fontFamily: 'Nunito', fontSize: 20.0, color: Colors.grey[850]),),
             onTap: () {
               Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                builder : (BuildContext context) => new FeedbackForm(currentUser: cuser)
              ));
             },
           ),
           new ListTile(
             leading: new Icon(Icons.info),
             contentPadding: new EdgeInsets.symmetric(horizontal: 40.0),
             title: new Text('About Us',style: new TextStyle(fontFamily: 'Nunito', fontSize: 20.0, color: Colors.grey[850]),),
             onTap: () {
               Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                builder : (BuildContext context) => new AboutUs()
              ));
             },
           ),
          ],
        ),

    ),

    body: new ListView(
        children: <Widget>[
            new HomeCard()
        ],
     ),
    );
  }
}

class HomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context){
   
     return new Column(
          children: <Widget>[
              new GestureDetector(child: new Card(
              margin: EdgeInsets.all(0.0),
              child: new Stack(
                fit: StackFit.passthrough,
                children: <Widget>[
                  new Image(image: new AssetImage("images/card2.jpg"),
                    fit: BoxFit.cover,
                    color: Colors.black54,
                    colorBlendMode: BlendMode.darken,),
                   new Padding(
                       padding: EdgeInsets.only(top:20.0,left:20.0),
                       child: new Row(children: <Widget>[
                          new Text('BANKING',style: new TextStyle(color: Colors.white,fontFamily:'Nunito',fontSize:40.0,fontStyle:FontStyle.italic, fontWeight: FontWeight.bold),)
                       ],
                      ),        
                      )
                    ],
              ), 
            ),
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new BankContent())),
          ),
              new GestureDetector(
          child: new Card(
              margin: EdgeInsets.all(0.0),
              child: new Stack(
                children: <Widget>[
                  new Image(image: new AssetImage("images/card1.png"),
                    fit: BoxFit.cover,
                    color: Colors.black54,
                    colorBlendMode: BlendMode.darken,),
                   new Padding(
                       padding: EdgeInsets.only(top:20.0,left:20.0),
                       child: new Row(children: <Widget>[
                          new Text('FINANCE',style: new TextStyle(color: Colors.white,fontFamily:'Nunito',fontSize:40.0,fontStyle:FontStyle.italic, fontWeight: FontWeight.bold),)
                       ],
                      ),
                    ),
                  ],
                ), 
              ),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new FinanceContent())),
            ),
           new GestureDetector(
           child: new Card(
              margin: EdgeInsets.all(0.0),
              child: new Stack(
                children: <Widget>[
                  new Image(image: new AssetImage("images/card3.jpg"),
                    fit: BoxFit.cover,
                    color: Colors.black54,
                    colorBlendMode: BlendMode.darken,),
                   new Padding(
                       padding: EdgeInsets.only(top:20.0,left:20.0),
                       child: new Row(children: <Widget>[
                          new Text('ECONOMICS',style: new TextStyle(color: Colors.white,fontFamily:'Nunito',fontSize:40.0,fontStyle:FontStyle.italic, fontWeight: FontWeight.bold),)
                       ],
                       ),
                       
                       )
                       ],
              ), 
            ),
             onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new EconomicsContent())),
          ),
           new GestureDetector(
           child: new Card(
              margin: EdgeInsets.all(0.0),
              child: new Stack(
                children: <Widget>[
                  new Image(image: new AssetImage("images/card4.jpg"),
                    fit: BoxFit.cover,
                    color: Colors.black54,
                    colorBlendMode: BlendMode.darken,),
                   new Padding(
                       padding: EdgeInsets.only(top:20.0,left:20.0),
                       child: new Row(children: <Widget>[
                          new Text('INVESTMENT',style: new TextStyle(color: Colors.white,fontFamily:'Nunito',fontSize:40.0,fontStyle:FontStyle.italic, fontWeight: FontWeight.bold),)
                       ],
                       ),
                       
                       )
                      ],
                    ), 
                  ),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new InvestmentContent())),
              ),
            ],
          );           
  }
} 

class HomeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AssetImage assetImage = AssetImage('images/stockmarket.jpg');
    Image image = Image(image: assetImage);
    return Container(child: image);
  }
}

class DrawerImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/drawerheader.jpg');
    Image image = Image(image: assetImage);
    return Container(child: image);
  }
}
