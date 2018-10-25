
import 'package:flutter/material.dart';
import './googlebutton.dart';

class GoogleBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              child: button('Google', 'images/google.png'),
              //padding: EdgeInsets.only(right:40.0),
              height:45.0,
              minWidth: 500.0,
              onPressed: (){},
              color: Colors.white,
            ),
          ],
        );
  }
}