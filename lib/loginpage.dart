import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override //Animation
  void initState() {
      super.initState();
      _iconAnimationController = new AnimationController(
        vsync:this,
      duration: new Duration(milliseconds: 500)
      );

      _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.bounceIn
      );
     
     _iconAnimation.addListener(() => this.setState(() {}));
     _iconAnimationController.forward();
  }
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       backgroundColor: Colors.blueAccent,
       body: new Stack(
         fit: StackFit.expand,
         children: <Widget>[
           new Image(
             image: new AssetImage("images/loginbg1.png"),
             fit: BoxFit.cover,
             color: Colors.black54,
             colorBlendMode: BlendMode.darken,
           
           ),
           new Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
              /* new Image(
                 image: new AssetImage("images/logo.png"),
                 width: 500.0, height: 220.0,
                 fit:BoxFit.fill
               ), */
               
          new Text("FinEduBot", style: new TextStyle(color: Colors.white,fontSize: 50.0,fontWeight: FontWeight.bold,),
          ),
           new Container(
             padding: const EdgeInsets.only(top:0.0),
             child: new Theme(
               data: new ThemeData(brightness: Brightness.dark,primarySwatch: Colors.blue, inputDecorationTheme: new InputDecorationTheme(
                 labelStyle: new TextStyle(color: Colors.white, fontSize: 20.0, fontStyle: FontStyle.italic))),

                    child: new Container(
                      //margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                      padding: const EdgeInsets.fromLTRB(40.0,0.0,40.0,30.0),
                                          child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                      new TextFormField(
                      
                        decoration: (new InputDecoration(
                          
                          labelText: "Email",
                          
                        )),
                      
                        keyboardType: TextInputType.emailAddress,
                        
                      ),
                      new TextFormField(decoration: (new InputDecoration(
                        labelText: "Password",
                      )),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top:40.0),
                      ),
                      new MaterialButton(
                        height: 40.0,
                        minWidth: 100.0,
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: new Text("Login", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),),
                        onPressed: () => {},
                        splashColor: Colors.lightBlue[900],
                        ),      
                 ],
               ),
                    ),
             ),
           )
            ],
          ),
        ],
      ),
      
    );
  }
}

/*  class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/logo.png');
    Image image = Image(image: assetImage);
    return new Container(child: image);
  } 
} */