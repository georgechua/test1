import 'package:flutter/material.dart';
import './carCalc.dart';
import './homeCalc.dart';

class CalcLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
      elevation: 1.0,
      centerTitle: true,
        title: new Text("Loan Calculators",style: new TextStyle(fontFamily: 'Nunito',color: Colors.grey[850],fontWeight: FontWeight.bold),),
      ),
      body: new Column(
        children:<Widget>[
        new Expanded(
            child: new Material(
            color: Colors.grey[850],
            child: new InkWell(
              onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder : (BuildContext context) => new HomeLoanCalc()
              ));
             },
              child: new Center(
                child: new Container(
                  margin: EdgeInsets.all(40.0),
                  decoration: new BoxDecoration(
                   border: new Border.all(color: Colors.white, width: 5.0)
                  ),
                  padding: new EdgeInsets.only(left:20.0,right:20.0,bottom: 30.0,top:30.0),
                  child: new Text('Home Loan Calculator',
                  style: new TextStyle(fontFamily:'Nunito',color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)
                  ),
              )
            ),
          ),
        ),
      ),
      new Expanded( 
            child: new Material(
            color: Colors.orange[800],
            child: new InkWell(
              onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder : (BuildContext context) => new CarLoanCalc()
              ));
             },
              child: new Center(
                child: new Container(
                  margin: EdgeInsets.all(40.0),
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Colors.white, width: 5.0)
                  ),
                  padding: new EdgeInsets.only(left:20.0,right:20.0,bottom: 30.0,top:30.0),
                  child: new Text('Car Loan Calculator',
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