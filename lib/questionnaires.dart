import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Questionnaires extends StatefulWidget {
  @override
  _QuestionnairesState createState() => _QuestionnairesState();
}

class _QuestionnairesState extends State<Questionnaires> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(
        elevation: 10.0,
        centerTitle: true,
        title: new Text('Questionnaires',style: new TextStyle(fontFamily: 'Nunito',color: Colors.grey[850],fontWeight: FontWeight.bold) ,),
      ),
      url: "https://docs.google.com/forms/d/1jf7ylad-qu_26AzAA7ndClfXWK0ipuyI5W7SDVzDu1Q",
      withZoom: true,
    );
  }
}