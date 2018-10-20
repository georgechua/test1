import 'package:flutter/material.dart';

//pages
import './quiz.dart';
import './result.dart';
import './logout.dart';
import './loginpage.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FinEduBot Demo',
      theme: new ThemeData(
        fontFamily: 'Nunito',
        primaryColor: Colors.blue,
      
        
        //canvasColor: Colors.blue[900],
      ),
      //home: new MyHomePage(title: 'Home'),
      home: new LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        title: new Text("Home")
      ),
    drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/drawerheader.jpg'),
                  fit: BoxFit.fill
                )
              ),
              accountName: new Text('George Chua'),
              accountEmail: new Text('georgechua@gmail.com'),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
              ),
            ),
           new ListTile(
             leading: new Icon(Icons.grade),
             contentPadding: new EdgeInsets.symmetric(horizontal: 16.0),
             title: new Text('Quiz'),
             onTap: () {
               Navigator.of(context).pop();
               Navigator.of(context).push(new MaterialPageRoute(
                 builder: (BuildContext context) => new QuizPage()) 
               );
             },
           ),
           new ListTile(
             leading: new Icon(Icons.question_answer),
             contentPadding: new EdgeInsets.symmetric(horizontal: 16.0),
             title: new Text('Result'),
             onTap: () {
               Navigator.of(context).pop();
               Navigator.of(context).push(new MaterialPageRoute(
                 builder: (BuildContext context) => new ResultPage()
               ));
             },
           ),
           new ListTile(
             leading: new Icon(Icons.exit_to_app),
             contentPadding: new EdgeInsets.symmetric(horizontal: 16.0),
             title: new Text('Log Out'),
             onTap: () {
               Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                builder : (BuildContext context) => new Logout()
              ));
             },
           )
          ],
        ),

    ),

    body: new Stack(
      children: <Widget>[
        new HomeCard()
      ],
    ),
    );
  }
}

class HomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context){
     return new Column(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.all(110.0),
                  decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage("images/stockmarket.jpg"),
                            fit: BoxFit.cover
                          )
                        ),
                    ),
              ],
            ),
        new Expanded(
                child: new Material(
                
                 color: Colors.blue[300],
                  child: new InkWell(
                    onTap: () => print("You choose 1"),
                    splashColor: Colors.greenAccent,
                    child: new Center(
                      
                      child: new Container(
                        
                        child: new Text("STOCK", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold, fontSize: 40.0)),
                      ),
                    ),
                  ),
                ),
            ),
            new Expanded(
              child: new Material(
                color: Colors.blue[500],
                child: new InkWell(
                  onTap: () => print("You choose 2"),
                  child: new Center(
                    child: new Container(
                      child: new Text("BANKING", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold, fontSize: 40.0)),
                    ),
                  ),
                ),
              ),
            ),
            new Expanded(
              child: new Material(
                color: Colors.blue[700],
                child: new InkWell(
                  onTap: () => print("You choose 3"),
                  child: new Center(
                    child: new Container(
                      child: new Text("ECONOMICS", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold, fontSize: 40.0)),
                    ),
                  ),
                ),
              ),
            ),
            new Expanded(
              child: new Material(
                color: Colors.blue[900],
                child: new InkWell(
                  onTap: () => print("You choose 4"),
                  child: new Center(
                    child: new Container(
                        child: new Text("INVESTMENT", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold, fontSize: 40.0)),
                    ),
                  ),
                ),
              ),
            )  
          ],
        );
  }
} 

class HomeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AssetImage assetImage = AssetImage('images/stockmarket.jpg');
    Image image = Image(image: assetImage);
    return Container(child: image);
  }
}

class DrawerImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/drawerheader.jpg');
    Image image = Image(image: assetImage);
    return Container(child: image);
  }
}