import 'package:flutter/material.dart';


//pages
import './pages/riskprofile_page.dart';
import './result.dart';
import './stockcontent.dart';
import './bankcontent.dart';
import './investcontent.dart';
import './economicscontent.dart';
import './feedback.dart';
import './pages/landing.dart';
import './auth.dart';
import './pages/home_page.dart';
import './root_page.dart';
import './pages/logout_page.dart';
import './loancalculator.dart';



void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FinEduBot Demo',
      theme: new ThemeData(
        //fontFamily: 'Nunito',
        primaryColor: Colors.blue,
        //canvasColor: Colors.blue[900],
      ),
     
     home: new RootPage(auth: new Auth()),
     //home: new Calc(),
     //home: new LogOut()
    );
  }
}
