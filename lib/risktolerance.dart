import 'package:flutter/material.dart';
import './pages/home_page.dart';

class RTQuiz {
  var questions = [
      //Total 10 Questions
      "How long do you intend to invest for?",
      "Your main purpose for investment is to:",
      "Which of these has the greatest priority for you?",
      "What are the chances that your timeframe will change?",
      "I would be prepared to have my money lose some value in the short term to achieve higher rates of return in the long term.",
      "I would prefer to have a lower, known fixed rate of return rather than any short term loss of money.",
      "I would want greater returns than a bank deposit account can offer.",
      "I would not invest in shares as the returns are too uncertain.",
      "I would be happy to invest in new startup companies.",
      "I would be happy to invest in the shares of overseas companies."
  ];

  var choices = [
      //10 Choices
      ["A. Less than 5 years","B. 5 - 10 years","C. 10 - 20 years","D. 20 & Above years"], //1
      ["A. Produce maximum capital growth for your retirement","B. Provide income and ensure little risk of loss","C. Provide some income but also growth","D. To gain interest and take no risk at all"],
      ["A. Generating investment income to live on today or in the next two years","B. Buying a new home","C. Providing funds for your childrens' education","D. Accumulating funds for retirement"],
      ["A. Highly likely - I need flexibility","B. Possibly - I could change my mind","C. Probably not - I am sure of my goals","D. None - it's cast in stone"],
      ["A. Strongly disagree","B. Disagree","C. Agree","D. Strongly agree"],
      ["A. Strongly disagree","B. Disagree","C. Agree","D. Strongly agree"],
      ["A. Strongly agree","B. Agree","C. Disagree","D. Strongly disagree"],
      ["A. Strongly disagree","B. Disagree","C. Agree","D. Strongly agree"],
      ["A. Strongly agree","B. Agree","C. Disagree","D. Strongly disagree"],
      ["A. Strongly agree","B. Agree","C. Disagree","D. Strongly disagree"], 
   
  ];

}

var questionNumber = 0;
var quiz = RTQuiz();
var aggressive = 0, modaggressive = 0, modconservative = 0, conservative = 0;
var finalScore = 0;
var user_type = '';
String agg = 'Aggressive';
String modagg = 'Moderate Aggressive';
String modconserv = 'Moderate Conservative';
String conserv = 'Conservative';

class RiskTolerance extends StatefulWidget {
  @override
  _RiskToleranceState createState() => _RiskToleranceState();
}

class _RiskToleranceState extends State<RiskTolerance> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Material(
        child: new Container(
          margin: EdgeInsets.all(0.0),
          alignment: Alignment.topCenter,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            
              new Container(
                padding: EdgeInsets.all(30.0),
                child: new Column(
                  children: <Widget>[
                    new Card(
                        color: Colors.black87,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                        elevation: 5.0,
                        margin: EdgeInsets.only(bottom: 20.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                              new Container(
                                padding: EdgeInsets.all(10.0),
                                child: new Text("${questionNumber + 1} / ${quiz.questions.length}",
                                  style: new TextStyle(color: Colors.white,fontSize:18.0,fontWeight: FontWeight.bold, fontFamily:'Nunito'),),
                                ), 
                            new Padding(
                              padding: new EdgeInsets.all(30.0),
                              child: new Text(quiz.questions[questionNumber],style:new TextStyle(color: Colors.white,fontSize:22.0,fontWeight: FontWeight.bold, fontFamily:'Nunito'),),),
                           
                        ],
                     ),
                  ),
                   new Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       //Button 1
                      new ButtonTheme(
                        padding: const EdgeInsets.all(12.0),
                        minWidth: double.infinity,
                        height: 50.0,
                          child: new MaterialButton(
                            color: Colors.green[700],
                            onPressed: (){
                              if(quiz.choices[questionNumber][0] == quiz.choices[questionNumber][0]){
                                //finalScore++;
                                aggressive++;
                                debugPrint("Aggressive: $aggressive");
                               
                              }
                              updateQuestion();
                            },
                            child: new Text(quiz.choices[questionNumber][0],style: new TextStyle(color: Colors.white,fontFamily: 'Nunito',fontSize: 20.0),),
                      ),
                    ),
                    new Padding(padding: const EdgeInsets.only(bottom: 20.0),),
                    //Button 2
                    new ButtonTheme(
                      padding: const EdgeInsets.all(12.0),
                      minWidth: double.infinity,
                      height: 50.0,
                        child: new MaterialButton(
                          color: Colors.green[700],
                            onPressed: (){
                                if(quiz.choices[questionNumber][1] == quiz.choices[questionNumber][1]){
                                  //finalScore++;
                                  modaggressive++;
                                  debugPrint("Moderate Aggressive: $modaggressive");
                                }
                                updateQuestion();
                                 },
                                  child: new Text(quiz.choices[questionNumber][1],style: new TextStyle(color: Colors.white,fontFamily: 'Nunito',fontSize: 20.0),),
                               ),
                             ),
                    new Padding(padding: EdgeInsets.only(bottom: 20.0),),
                    //Button 3
                    new ButtonTheme(
                       padding: const EdgeInsets.all(12.0),
                        minWidth: double.infinity,
                        height: 50.0,
                          child: new MaterialButton(
                            color: Colors.green[700],
                          onPressed: (){
                            if(quiz.choices[questionNumber][2] == quiz.choices[questionNumber][2]){
                             // finalScore++;
                              modconservative++;
                              debugPrint("Moderate Conservative: $modconservative");
                            }
                            updateQuestion();
                          },
                          child: new Text(quiz.choices[questionNumber][2],style: new TextStyle(color: Colors.white,fontFamily: 'Nunito',fontSize: 20.0),),
                        ),
                    ),
                      new Padding(padding: const EdgeInsets.only(bottom: 20.0),),
                    //Button 4
                   new ButtonTheme(
                     padding: const EdgeInsets.all(12.0),
                     minWidth: double.infinity,
                     height: 50.0,//Button 4
                        child: new MaterialButton(
                          color: Colors.green[700],
                          onPressed: (){
                          if(quiz.choices[questionNumber][3] == quiz.choices[questionNumber][3]){
                           // finalScore++;
                            conservative++;
                             debugPrint("Conservative: $conservative");
                          }
                          updateQuestion();
                        },
                    child: new Text(quiz.choices[questionNumber][3],style: new TextStyle(color: Colors.white,fontFamily: 'Nunito',fontSize: 20.0),),),
                    ),
                  ],
                ), 
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }

void updateQuestion(){
    setState(() {
        if (questionNumber == quiz.questions.length - 1){
          if(aggressive > modaggressive){
            if(aggressive > modconservative)
                  user_type = (aggressive > conservative) ? agg : conserv;
            else
                  user_type = (modaggressive > conservative) ? modconserv : conserv;  
         }else if(modaggressive > modconservative){
              user_type = (modaggressive > conservative) ? modagg : conserv;
         }else
              user_type = (modconservative > conservative) ? modconserv : conserv;
              
          Navigator.push(context,new MaterialPageRoute(builder: (context) => new Summary(type: user_type)));
          

        }else {
          questionNumber++;
        }
    });
  }
}

class Summary extends StatelessWidget {
  final String type;
  Summary({Key key, @required this.type}) : super(key:key);
  
  @override
  Widget build(BuildContext context){
      return new WillPopScope(
         onWillPop: () async => false,
          child: Scaffold(
            body: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                     new Text('Your Risk Tolerance level is:',style: new TextStyle(color: Colors.black,fontFamily: 'Nunito',fontSize: 20.0),),

                    new Container(
                      
                      margin: EdgeInsets.only(top:40.0,bottom:40.0),
                      
                      decoration: new BoxDecoration(
                        
                         border: new Border.all(color: Colors.black, width: 5.0)
                        ),
                      
                      padding: new EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
                      child: new Text('$user_type',style: new TextStyle(color: Colors.black,fontFamily: 'Nunito',fontSize: 30.0,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                   
                ),
                   
                    
                    new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.black,
            iconSize: 90.0,
            onPressed: (){
              Navigator.pop(context);
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyHomePage()));
              questionNumber = 0;
              aggressive = 0;
              modaggressive = 0;
              modconservative = 0;
              conservative = 0;
                  
            
              },
            
             
          ),
        
        ],
                
              ),
            ),
          )
         
      );
  }

}

