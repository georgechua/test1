import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../ui/ans_button.dart';
import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';

import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State <QuizPage>{

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Financial modelling is a quantitative analysis commonly used for either asset pricing or general corporate finance.", true),
    new Question("Cash flow statement a.k.a cash flow is a financial statement that shows how changes in balance sheet accounts and income affect cash and cash equivalents, and breaks the analysis down to operating, investing and financing activities. Essentially, the cash flow statement is concerned with the flow of cash in and out of the business.", true),
    new Question("Is it possible for a company to have positive cash flow but still be in serious financial trouble?", true),
    new Question("Working capital is the best defined as current assets minus current liabilities.", true),
    new Question("Cost accountancy is the application of costing and cost accounting principles, methods and techniques to the science, art and practice of cost control and the ascertainment of profitability as well as the presentation of information for the purpose of managerial decision making.", true),
    new Question("Financial planning generally involves analysing an individual's or a family's current financial position, and formulating strategies for future needs within financial constraints.", true), 
    new Question("Corporate finance is a very personal activity that depends largely on one's earnings, living requirements, goals and individual desires.", false), 
    new Question("Finance is a group or network of institutions that provide financial services for us.", false),   
    new Question("Investing is a habit that teenagers should start earlier. Is the statement true?", true),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;
  int resultCount = 0;

  @override
  void initState(){
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
      this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
    child: new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( 
        children: [
                    new AnswerButton(true, () => handleAnswer(true)),
                    new QuestionText(questionText, questionNumber),
                    new AnswerButton(false, () => handleAnswer(false)),     
  ],
),

        overlayShouldBeVisible == true ? new CorrectWrongOverlay(
          isCorrect,
          ()  {
            if (quiz.length == questionNumber) {
              
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
              return;
            }
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
              
            });
          }
        ) : new Container()
      ],
    ),
    );
  }
}