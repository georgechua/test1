import 'package:flutter/material.dart';
import '../materialbtn.dart';

class RiskProfile extends StatefulWidget {
  @override
  _RiskProfileState createState() => _RiskProfileState();
}

class _RiskProfileState extends State<RiskProfile> {

  bool sel = false;
  bool sel1 = false;


  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Risk Profile Assessment'),
        actions: <Widget>[
          
          new Container(
            padding: EdgeInsets.only(right:10.0),
            child: new IconButton(icon: const Icon(Icons.person), iconSize: 35.0, 
            onPressed: () {}))
          ],
        ),
        
          body: new Column(
            children: <Widget> [
              new Padding(padding: EdgeInsets.all(10.0),),
              new ListTile(
                title: new TextField(
                  autofocus: false,
                  decoration: new InputDecoration(
                    labelText: 'Monthly Income (RM)',
                    labelStyle: TextStyle(fontFamily: 'Nunito',fontSize: 20.0,color: Colors.black54),
                          contentPadding: EdgeInsets.fromLTRB(20.0,30.0,0.0,0.0),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(15.0)
                              )
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              new Padding(padding: EdgeInsets.symmetric(vertical:10.0),),
              new ListTile(
                title: new TextField(
                  autofocus: false,
                  decoration: new InputDecoration(
                    labelText: 'Monthly Commitment (RM)',
                    labelStyle: TextStyle(fontFamily: 'Nunito',fontSize: 20.0,color: Colors.black54),
                          contentPadding: EdgeInsets.fromLTRB(20.0,30.0,0.0,0.0),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(15.0)
                              )
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
             new Padding(padding: EdgeInsets.symmetric(vertical:5.0),),
             new Column(
                children: <Widget>[
                  new CheckboxListTile(
                    title: new Text('Debt free?'),
                    onChanged: (bool resp){
                      setState(() {
                          sel = resp;
                                        });
                    },
                    value: sel,
             ),
              new CheckboxListTile(
                title: new Text('Married?'),
                onChanged: (bool resp){
                  setState(() {
                      sel1 = resp;
               });
              },
                       value: sel1,
             )
            ],
          ),
            new RiskProfileButton()
        ],
       ),
     );
  }
}