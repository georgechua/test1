import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

//pages
import './riskprofile_page.dart';
import '../result.dart';
import '../stockcontent.dart';
import '../bankcontent.dart';
import '../investcontent.dart';
import '../economicscontent.dart';
import '../feedback.dart';
import '../pages/landing.dart';
import '../auth.dart';

enum DialogAction{
  yes,
  no
}


class MyHomePage extends StatelessWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);
  //final String title;
  MyHomePage({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  
void _signOut() async{
    try{
        await auth.signOut();
        onSignedOut();
    }catch(e){

    }
}
/* void _showAlert() {
  AlertDialog dialog = new AlertDialog(
     content: new Text("Confirm LogOut?", 
     style: new TextStyle(
      fontSize:20.0,
      fontFamily: 'Nunito',
      //fontWeight: FontWeight.bold,
      ),
    ),
    actions: <Widget>[
        new FlatButton(
          onPressed: null,
          child: Text('YES', 
            style: new TextStyle(
            fontSize: 18.0,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            color: Colors.black,
            ),
            )
          ),
        new FlatButton(
          //onPressed: _confirmNO,
          child: Text('NO', 
            style: new TextStyle(
              fontSize: 18.0,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              ),
              )
          )
    ],
  );

  //showDialog(context: context, child: dialog);

} */

/* void _confirmNO() {
  Navigator.pop(context);
  Navigator.pop(context);
} */


  @override
  Widget build(BuildContext context) {
      
    return new Scaffold(
      appBar: new AppBar(
      title: new Text('Home'),
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
              new UserAccountsDrawerHeader(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/drawerheader.jpg'),
                  fit: BoxFit.fill
                )
              ),
              accountName: new Text(''),
              accountEmail: new Text(''),
              /* currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('http://i.pravatar.cc/300'
                ), 
              ), */
              
          /*   otherAccountsPictures: <Widget>[
                      new CircleAvatar(
                        backgroundImage: new NetworkImage('http://i.pravatar.cc/200'),
                      )
              ], */
            ), 
            
           new ListTile(
             leading: new Icon(Icons.grade),
             //contentPadding: new EdgeInsets.symmetric(horizontal: 16.0),
             title: new Text('Quiz'),
             onTap: () {
               Navigator.of(context).pop();
               Navigator.of(context).push(new MaterialPageRoute(
                 builder: (BuildContext context) => new Landing()) 
               );
             },
           ),
           new ListTile(
             leading: new Icon(Icons.question_answer),
             contentPadding: new EdgeInsets.symmetric(horizontal: 16.0),
             title: new Text('Result'),
             onTap: () {
               Navigator.of(context).pop();
               Navigator.of(context).push(new MaterialPageRoute(
                 builder: (BuildContext context) => new ResultPage()
               ));
             },
           ),
           new ListTile(
             leading: new Icon(Icons.person),
             contentPadding: new EdgeInsets.symmetric(horizontal: 16.0),
             title: new Text('Risk Profile'),
             onTap: () {
               Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                builder : (BuildContext context) => new RiskProfile()
              ));
             },
           ),
           new ListTile(
             leading: new Icon(Icons.feedback),
             contentPadding: new EdgeInsets.symmetric(horizontal: 16.0),
             title: new Text('Feedback'),
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
                
                 color: Colors.blue[300],
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
                color: Colors.blue[500],
                child: new InkWell(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new BankContent())),
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
                color: Colors.blue[700],
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

