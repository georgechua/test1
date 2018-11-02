import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//pages
import './riskprofile_page.dart';
import '../result.dart';
import '../stockcontent.dart';
import '../financecontent.dart';
import '../investcontent.dart';
import '../economicscontent.dart';
import '../feedback.dart';
import '../pages/landing.dart';
import '../auth.dart';
import './logout_page.dart';
import '../loancalculator.dart';


class MyHomePage extends StatelessWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);
  //final String title;

  MyHomePage({this.auth, this.onSignedOut,this.user,this.email});
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final FirebaseUser user;
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
      title: new Text('Home'),
      centerTitle: true,
      elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      actions: <Widget>[
        new FlatButton(
          child: new Icon(Icons.exit_to_app,color: Colors.white,size: 30.0,),
          padding: EdgeInsets.only(left:30.0),
          onPressed: _signOut,
          
        ),
         
      ],
      
    ),
      drawer: new Drawer(
        child: ListView(
          
          children: <Widget>[
            new Container(
              padding: EdgeInsets.fromLTRB(38.0,50.0,40.0,30.0),
                child: new Text('FINEDUBOT',style: new TextStyle(fontSize:38.0, fontFamily:'Nunito',fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.grey[850])),
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
             title: new Text('Loan Calculator',style: new TextStyle(fontFamily: 'Nunito', fontSize: 20.0, color: Colors.grey[850]),),
             onTap: () {
               Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                builder : (BuildContext context) => new Calc()
              ));
             },
           ),
           new ListTile(
             leading: new Icon(Icons.feedback),
             contentPadding: new EdgeInsets.symmetric(horizontal: 40.0),
             title: new Text('Feedback',style: new TextStyle(fontFamily: 'Nunito', fontSize: 20.0, color: Colors.grey[850]),),
             onTap: () {
               Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                builder : (BuildContext context) => new FeedbackForm()
              ));
             },
           ),
          ],
        ),

    ),

    body: new Stack(
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
            new Column(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.all(110.0),
                  decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage("images/stockmarket.jpg"),
                            fit: BoxFit.cover
                          )
                        ),
                    ),
              ],
            ),
        new Expanded(
                child: new Material(
                
                 color: Colors.blue[600],
                  child: new InkWell(
                    onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new StockContent())),
                    splashColor: Colors.greenAccent,
                    child: new Center(
                      
                      child: new Container(
                        
                        child: new Text("STOCK", style: TextStyle(color: Colors.white,fontFamily: 'Nunito', fontStyle: FontStyle.italic,fontWeight: FontWeight.bold, fontSize: 40.0)),
                      ),
                    ),
                  ),
                ),
            ),
            new Expanded(
              child: new Material(
                color: Colors.blue[700],
                child: new InkWell(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new FinanceContent())),
                  child: new Center(
                    child: new Container(
                      child: new Text("BANKING", style: TextStyle(color: Colors.white,fontFamily: 'Nunito', fontStyle: FontStyle.italic,fontWeight: FontWeight.bold, fontSize: 40.0)),
                    ),
                  ),
                ),
              ),
            ),
            new Expanded(
              child: new Material(
                color: Colors.blue[800],
                child: new InkWell(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new EconomicsContent())),
                  child: new Center(
                    child: new Container(
                      child: new Text("ECONOMICS", style: TextStyle(color: Colors.white,fontFamily: 'Nunito', fontStyle: FontStyle.italic,fontWeight: FontWeight.bold, fontSize: 40.0)),
                    ),
                  ),
                ),
              ),
            ),
            new Expanded(
              child: new Material(
                color: Colors.blue[900],
                child: new InkWell(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new InvestmentContent())),
                  child: new Center(
                    child: new Container(
                        child: new Text("INVESTMENT", style: TextStyle(color: Colors.white,fontFamily: 'Nunito', fontStyle: FontStyle.italic,fontWeight: FontWeight.bold, fontSize: 40.0)),
                    ),
                  ),
                ),
              ),
            )  
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

/* class GetUser extends StatelessWidget {
  String email = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  new FutureBuilder<FirebaseUser>(
                future: FirebaseAuth.instance.currentUser(),
                builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    email = (snapshot.data.email);
                    return new Text(email);
                  }
                  else {
                    return new Text('Loading...');
                  }
                },
              ),
    );
  }
} */