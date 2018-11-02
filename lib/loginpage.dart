import 'package:flutter/material.dart';

//Pages
import 'auth.dart';

class LoginPage extends StatefulWidget {


  LoginPage({this.auth,this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State createState() => _LoginPageState();
}

enum FormType { 
  login,
  register
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
 
  //Form validate var
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave(){
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    else {
      return false;
    }
  }

  void validateAndSubmit() async{
      if(validateAndSave()){
          try {
            if(_formType == FormType.login) {
              String userId = await widget.auth.signInWithEmailAndPassword(_email, _password); 
              print('Signed In : $userId');
            }else {
              String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
              print('Registered User : $userId');
            }
            widget.onSignedIn();
          }
          catch (e) {
            print('Error: $e');
          }
      }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
          _formType = FormType.register;
        });
  }

void moveToLogin(){
  formKey.currentState.reset();
  setState(() {
      _formType = FormType.login;
    });
}

  //Animation Controller properties
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
  
   final emailController = TextEditingController();

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
            new Text("FinEduBot", style: new TextStyle(color: Colors.white,fontSize: 50.0,fontWeight: FontWeight.bold,fontFamily: 'Nunito'),
            ),
            new Container(
                padding: const EdgeInsets.all(20.0),
                child: new Theme(
                  data: new ThemeData(brightness: Brightness.dark,primarySwatch: Colors.blue, inputDecorationTheme: new InputDecorationTheme(
                  labelStyle: new TextStyle(fontFamily:'Nunito',color: Colors.white, fontSize: 20.0, fontStyle: FontStyle.italic))),

                    child: new Form(
                        key:formKey,         
                        child: new Column(                    
                        crossAxisAlignment: CrossAxisAlignment.center,
                         children: buildInputs() + buildSubmitButtons(),
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


  List<Widget> buildInputs(){
        return [
          new TextFormField(
            controller: emailController,
            decoration: (new InputDecoration(
            labelText: "Email",
            )),
            validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
            onSaved: (value) => _email = value,
            keyboardType: TextInputType.emailAddress,
          ),
          new TextFormField(
            decoration: (new InputDecoration(
            labelText: "Password",
            )),
            keyboardType: TextInputType.text,
            obscureText: true,
            validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
            onSaved: (value) => _password = value,
          ),
          new Padding(
                        padding: const EdgeInsets.only(top:30.0)),
           
     ];
  }

  List<Widget> buildSubmitButtons() {
      if (_formType == FormType.login) {    
      return [
          new MaterialButton(
                        elevation: 5.0,
                        height: 40.0,
                        minWidth: 500.0,
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: new Text("Sign In", style: new TextStyle(fontFamily: 'Nunito',fontWeight: FontWeight.bold, fontSize: 19.0),),
                        
                        onPressed: validateAndSubmit,
                      
                        splashColor: Colors.blue[600],
                    ),
                    new Padding(
                        padding: const EdgeInsets.only(bottom:15.0),
                  ),
                   // new GoogleBtn(),
                    new FlatButton(
                      child: new Text('Create an account', 
                        style: new TextStyle(
                          fontSize: 19.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal,
                          color: Colors.white
                          ), 
                        ),
                        onPressed: moveToRegister,
                  ),
                ];
     } else {
       return [
         new MaterialButton(
                        elevation: 5.0,
                        height: 40.0,
                        minWidth: 500.0,
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: new Text("Create an account", style: new TextStyle(fontFamily: 'Nunito',fontWeight: FontWeight.bold, fontSize: 19.0,),),
                        onPressed: validateAndSubmit,
                        splashColor: Colors.blue[600],
                    ),
                     new Padding(
                        padding: const EdgeInsets.only(bottom:15.0),
                  ),
        new MaterialButton(
                        elevation: 5.0,
                        height: 40.0,
                        minWidth: 500.0,
                        color: Colors.green[600],
                        textColor: Colors.white,
                        child: new Text("Have an account? Login", style: new TextStyle(fontFamily: 'Nunito',fontWeight: FontWeight.bold, fontSize: 19.0),),
                        onPressed: moveToLogin,
                        splashColor: Colors.white70,
                    ),            
       ];
     }
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