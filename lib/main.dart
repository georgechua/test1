import 'package:flutter/material.dart';

//pages
import './auth.dart';
import './root_page.dart';
// unused pages
import './pages/riskprofile_page.dart';
import './result.dart';
import './stockcontent.dart';
import './financecontent.dart';
import './investcontent.dart';
import './economicscontent.dart';
import './feedback.dart';
import './pages/landing.dart';
import './pages/home_page.dart';
import './pages/logout_page.dart';
import './loancalculator.dart';



void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinEduBot Demo',
      theme: new ThemeData(
        //fontFamily: 'Nunito',
        primaryColor: Colors.blue[700],
        canvasColor: Colors.white,
      ),
     
     home: new RootPage(auth: new Auth()),
     //home: new Calc(),
     //home: new StockContent()
    );
  }
}
