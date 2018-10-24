import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SpinKit extends StatelessWidget {

  /* @override
    void initState() { 
      super.initState();
          Timer((Duration(seconds: 5)), () => print("Hi"));
    } */
    @override
  Widget build(BuildContext context) {
        return new Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: <Widget>[
           new Container(
             
             child: new SpinKitPouringHourglass(
                color: Colors.white,
                size: 100.0,),
            padding: EdgeInsets.only(bottom: 30.0),
           ),
              
          
          ],
         );
  }
}
   
