import 'package:flutter/material.dart';

//pages
import './auth.dart';
import './root_page.dart';

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
        primaryColor: Colors.white,
        canvasColor: Colors.white,
      ),
     
     home: new RootPage(auth: new Auth()),
     //home: new FinancialLiteracy()
     //home: new StockContent()
    );
  }
}
