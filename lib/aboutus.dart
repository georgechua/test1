import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 1.0,
        title: new Text('About Us'),
        centerTitle: true,
      ),
      body: new Container(

            padding: EdgeInsets.only(top:30.0,left:70.0),
              child: new Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                   
             //      new Padding(
              //       padding: EdgeInsets.only(bottom: 20.0),
              //     child: new Text('FinEduBot Team Member',style: new TextStyle(fontFamily: 'Nunito',fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
              //     ),
                   new Container(
                     
                     alignment: Alignment.center,
                     padding: EdgeInsets.only(left:0.0),
                    width: 150.0,
                    height: 150.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                    
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage(
                                'images/george.png')
                        )
                    ),
                  ),
               new Padding(
                 padding: EdgeInsets.fromLTRB(20.0,20.0,20.0,40.0), 
                 child: new Column(
                   //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text('Chua Teck Sing',style: new TextStyle(fontFamily:'Nunito',fontSize:15.0,color: Colors.grey[850]),),
                    new Text('+6017-2051033',style: new TextStyle(fontFamily:'Nunito',fontSize:15.0,color: Colors.grey[850]),),
                    new Text('chuats-wa15@student.tarc.edu.my',style: new TextStyle(fontFamily:'Nunito',fontSize:15.0,color: Colors.grey[850]),),
                    
                  ],
                ),
              ),
               new Container(
                     
                     alignment: Alignment.center,
                     padding: EdgeInsets.only(left:0.0),
                    width: 150.0,
                    height: 150.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                    
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage(
                                'images/jared.png')
                        )
                    ),
                  ),
               new Padding(
                 padding: EdgeInsets.all(20.0), 
                 child: new Column(
                   //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text('Goo Chun Meng',style: new TextStyle(fontFamily:'Nunito',fontSize:15.0,color: Colors.grey[850]),),
                    new Text('+6016-6389749',style: new TextStyle(fontFamily:'Nunito',fontSize:15.0,color: Colors.grey[850]),),
                    new Text('goocm-wp12@student.tarc.edu.my',style: new TextStyle(fontFamily:'Nunito',fontSize:15.0,color: Colors.grey[850]),),
                    new Padding(
                      padding: EdgeInsets.only(top:32.0),
                      child: new Text('v1.2',style: new TextStyle(fontFamily:'Nunito',fontStyle:FontStyle.italic),),)
                  ],
                ),
              )
            
            
            
            
            
            
            ],
          )
        
      
        
    )
    );
  }
}