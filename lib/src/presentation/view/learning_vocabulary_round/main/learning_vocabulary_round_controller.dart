import 'package:get/get.dart';

import '../../../../data/models/word.dart';

class LearningVocabularyRoundController extends GetxController{
  int indexAnswer = 0;
  String typeQuestion = 'string';
  int sttQuestion = 1;
  int nextRound = 5;
  int numberOfRounds = 7;
  Map<String,dynamic>? roundStatus;
  String wordTopicName = '';
  List<WordModel> roundVocabulary = [];

  @override
  void onInit() async {
    super.onInit();
    var args = Get.arguments;
    roundStatus = args['roundStatus'];
    wordTopicName = args['wordTopicName'];
    roundVocabulary = args['roundVocabulary'];
    update();
  }

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