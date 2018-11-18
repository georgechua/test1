import 'package:flutter/material.dart';
import './pages/home_page.dart';

class FLQuiz {
  var questions = [
      //Total 6 Questions
      "Imagine that the interest rate on your savings account was 1% per year and inflation was 2% per year. After 1 year, with the money in this account, you would be able to buy more than today.",
      "Suppose you need to borrow 100 US dollars. Which is the lower amount to pay back?",
      "Suppose you put money in the bank for two years and the bank agrees to add 15 percent per year to your account. Will the bank add more money to your account the second year than it did the first year, or will it add the same amount of money both years?",
      "Suppose you had 100 US dollars in a savings account and the bank adds 10 percent per year to the account. How much money would you have in the account after five years if you did not remove any money from the account?",
      "Suppose over the next 10 years the prices of the things you buy double. If your income also doubles, will you be able to buy less than you can buy today, the same as you can buy today, or more than you can buy today?",
      "Suppose you have some money. Is it safer to put your money into one business or investment, or to put your money into multiple businesses or investments?",
  ];

  var choices = [
      //6 Choices
      ["A. True","B. False","C. Dont't know","D. Refuse to answer"], //1
      ["A. 105 US Dollars","B. 100 US Dollars plus 3%","C. Don't know","D. Refuse to answer"],
      ["A. More","B. The Same","C. Don't know","D. Refuse to answer"],
      ["A. More than 150 Dollars","B. Exactly 150 Dollars","C. Don't know","D. Refuse to answer"],
      ["A. Less","B. The Same","C. More","D. Don't know"],
      ["A. One business or Investment","B. Multiple businesses and investments","C. Don't know","D. Refuse to answer"],
   
  ];

  var correctAnswer = [
      "A. True",
      "B. 100 US Dollars plus 3%",
      "A. More",
      "A. More than 150 Dollars",
      "B. The Same",
      "B. Multiple businesses and investments"

  ];

}

var questionNumber = 0;
var quiz = FLQuiz();
var finalScore = 0;
String advisor = '';



class FinancialLiteracy extends StatefulWidget {
  @override
  _FinancialLiteracyState createState() => _FinancialLiteracyState();
}

class _FinancialLiteracyState extends State<FinancialLiteracy> {
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
                              padding: new EdgeInsets.only(left:20.0,right:10.0,bottom:15.0),
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
                              if(quiz.choices[questionNumber][0] == quiz.correctAnswer[questionNumber]){
                                finalScore++;
                                 debugPrint("Correct");
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
                                if(quiz.choices[questionNumber][1] == quiz.correctAnswer[questionNumber]){
                                  finalScore++;
                                  debugPrint("Correct");
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
                            if(quiz.choices[questionNumber][2] == quiz.correctAnswer[questionNumber]){
                             finalScore++;
                              debugPrint("Correct");
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
                          if(quiz.choices[questionNumber][3] == quiz.correctAnswer[questionNumber]){
                           finalScore++;
                            debugPrint("Correct");
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
          if(finalScore / questionNumber < 0.5){
            if(finalScore / questionNumber == 0.0){
                advisor = 'Oops, seems like not enough effort is being work on.';
            }else{
              advisor = 'Aww, Your Financial Literacy is weak and need to work harder.';
            }
            
          }else if (finalScore / questionNumber > 0.5) {
            if(finalScore / questionNumber == 1.0){ 
              advisor = 'Congratulations, Your Financial Literacy is on point!';
               
            }else if(finalScore / questionNumber != 0.5){
              advisor = 'That was close, try harder next time';
              

            }else{
              advisor = 'Not bad, try harder next time!';
            }    
            
          }
       

           
          
          Navigator.push(context,new MaterialPageRoute(builder: (context) => new Summary(score: finalScore, advice: advisor,)));
          

        }else {
          questionNumber++;
        }
    });

  }
}

class Summary extends StatelessWidget {
  final int score;
  final String advice;
  Summary({Key key, @required this.score, this.advice}) : super(key:key);
  
  @override
  Widget build(BuildContext context){
      return new WillPopScope(
         onWillPop: () async => false,
          child: Scaffold(
            body: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      
                      margin: EdgeInsets.symmetric(horizontal:50.0),
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: new Text('$advisor',style: new TextStyle(color: Colors.black,fontFamily: 'Nunito',fontSize: 30.0),),
                    ),
                     

                    new Container(
                      
                      margin: EdgeInsets.only(top:40.0,bottom:40.0),
                      decoration: new BoxDecoration(
                        
                         border: new Border.all(color: Colors.black, width: 5.0)
                        ),
                      
                      padding: new EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
                      child: new Text('$finalScore / ${quiz.questions.length}',style: new TextStyle(color: Colors.black,fontFamily: 'Nunito',fontSize: 30.0,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                
                ),
                   
                    
                    new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.black,
            iconSize: 90.0,
            onPressed: (){
              Navigator.pop(context);
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyHomePage()));
              questionNumber = 0;
              finalScore = 0;
            
              },
            
             
          ),
        
        ],
                
              ),
            ),
          )
         
      );
  }

}

