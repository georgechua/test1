import 'package:flutter/material.dart';
import '../auth.dart';

class LogOut extends StatelessWidget {
  LogOut({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  
void _signOut() async{
    try{
        await auth.signOut();
        onSignedOut();
    }catch(e){
        print(e);
    }
}


  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(
         title: new Text('Sign Out'),
       ),
       body: new Center(
         child: new Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
              new MaterialButton(
                onPressed: _signOut,//(){_showAlert();},
                  height: 50.0,
                  minWidth: 300.0,
                  color: Colors.red,
                child: Text('Sign Out', 
                  style: new TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                ),
              )
            )
           ],
         ),
       )
     );
  }

}








