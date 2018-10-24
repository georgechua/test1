import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  List<Widget>cards = new List.generate(10, (i)=>new CustomCard());


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Result Page'),
      ),

     body: new Container(
              child: new ListView(
                children: cards,
              )

            )
    );
  }
}


class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new Card(
                    child: new Column(
                      children: <Widget>[
                        new Image.network('https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg'),
                        new Padding(
                          padding: new EdgeInsets.all(7.0),
                          child: new Row(
                            children: <Widget>[
                           /*  new Padding(
                               padding: new EdgeInsets.all(7.0),
                               child: new Icon(Icons.thumb_up),
                             ), */
                             new Padding(
                               padding: new EdgeInsets.all(7.0),
                               child: new Text('Date: 21-10-2018',style: new TextStyle(fontSize: 18.0),),
                             ),
                             /* new Padding(
                               padding: new EdgeInsets.all(7.0),
                               child: new Icon(Icons.comment),
                             ), */
                             new Padding(
                               padding: new EdgeInsets.all(7.0),
                               child: new Text('Time: 2:00PM',style: new TextStyle(fontSize: 18.0)),
                             )

                            ],
                          )
                        )
                      ],
                    ),
                  );
  }
}