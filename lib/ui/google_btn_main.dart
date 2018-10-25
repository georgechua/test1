
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './googlebutton.dart';
import '../pages/home_page.dart';

class GoogleBtn extends StatelessWidget {
  GoogleBtn({this.onSignedOut});
  final VoidCallback onSignedOut;

//Google SignIn Firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  //Google Sign in var
  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;
   
    FirebaseUser user = await _auth.signInWithGoogle(
      idToken: gSA.idToken, accessToken: gSA.accessToken);
      print("User Name : ${user.displayName}");
      return user;
  }

  @override
  Widget build(BuildContext context) {

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              child: button('Google', 'images/google.png'),
              //padding: EdgeInsets.only(right:40.0),
              height:45.0,
              minWidth: 500.0,
              onPressed: () => _signIn().then((FirebaseUser user) => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => MyHomePage()), (Route route) => route == null)).catchError((e) => print(e)),
              color: Colors.white,
            ),
          ],
        );
  }
}

