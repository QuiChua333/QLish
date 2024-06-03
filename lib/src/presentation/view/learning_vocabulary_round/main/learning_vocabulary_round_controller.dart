import 'package:get/get.dart';

class LearningVocabularyRoundController extends GetxController{
  int indexAnswer = 0;
  String typeQuestion = 'string';
  int sttQuestion = 1;
  int nextRound = 5;
  int numberOfRounds = 7;

  void setIndexAnswer(index) {
    indexAnswer = index;
    update();
  }

  void nextQuestion() {
    sttQuestion++;
    if (sttQuestion>10) sttQuestion=1;
    update();
  }
}