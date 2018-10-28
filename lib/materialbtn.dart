import 'package:flutter/material.dart';
import './loginpage.dart';


class RiskProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialButton(
                        height: 40.0,
                        minWidth: 100.0,
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: new Text("Submit", style: new TextStyle(fontFamily: 'Nunito', fontSize: 17.0),),
                        onPressed: () => {},
                        splashColor: Colors.lightBlue[900],
                    );
  }
}
