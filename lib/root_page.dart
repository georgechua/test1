import 'package:flutter/material.dart';
import './loginpage.dart';
import 'auth.dart';
import './pages/home_page.dart';
import './pages/logout_page.dart';


class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;

  @override
  _RootPageState createState() => _RootPageState();
}


enum AuthStatus {
  notSignedIn,
  signedIn
}

class _RootPageState extends State<RootPage> {

  AuthStatus authStatus = AuthStatus.notSignedIn;

  initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
       setState(() {
          authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn(){
    setState(() {
          authStatus = AuthStatus.signedIn;
        });
  }

  void _signedOut(){
    setState(() {
          authStatus = AuthStatus.notSignedIn;
        });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return new LoginPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
        
      case AuthStatus.signedIn:
        return new MyHomePage(
          auth: widget.auth,
          onSignedOut: _signedOut,
        );
        
    }
  }
}