import './question.dart';


class Quiz {
  List<Question> _questions;
  int _currentNo = -1;
  int _score = 0;

Quiz(this._questions) {
  _questions.shuffle();
}


List<Question> get questions => _questions;
int get length => _questions.length;
int get questionNumber => _currentNo+1;
int get score => _score;


Question get nextQuestion{
  _currentNo++;
  if (_currentNo >= length) return null;
  return _questions[_currentNo];
}

void answer(bool isTrue) {
  if(isTrue) _score++;
}

}


