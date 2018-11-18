import 'package:flutter/material.dart';
import './risktolerance.dart';
import './financeliteracy.dart';


class RiskProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
      elevation: 1.0,
      centerTitle: true,
        title: new Text("Risk Profile Assessment",style: new TextStyle(fontFamily: 'Nunito',color: Colors.grey[850],fontWeight: FontWeight.bold),),
      ),
      body: new Column(
        children:<Widget>[
        new Expanded(
       // flex: 1, //true button expand
            child: new Material(
            color: Colors.indigo[800],
            child: new InkWell(
              onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder : (BuildContext context) => FinancialLiteracy()
              ));
             },
              child: new Center(
                child: new Container(
                  margin: EdgeInsets.all(40.0),
                  decoration: new BoxDecoration(
                   border: new Border.all(color: Colors.white, width: 5.0)
                  ),
                  padding: new EdgeInsets.only(left:20.0,right:20.0,bottom: 30.0,top:30.0),
                  child: new Text('1. Financial Literacy',
                  style: new TextStyle(fontFamily:'Nunito',color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)
                  ),
              )
            ),
          ),
        ),
      ),
      new Expanded( 
            child: new Material(
            color: Colors.indigo[800],
            child: new InkWell(
              onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder : (BuildContext context) => RiskTolerance()
              ));
             },
              child: new Center(
                child: new Container(
                  margin: EdgeInsets.all(40.0),
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Colors.white, width: 5.0)
                  ),
                  padding: new EdgeInsets.only(left:20.0,right:20.0,bottom: 30.0,top:30.0),
                  child: new Text('2. Risk Tolerance',
                  style: new TextStyle(fontFamily:'Nunito',color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)
                  ),
              )
            ),
          ),
        ),
      ),
        ]
      ),
    );
  }
}