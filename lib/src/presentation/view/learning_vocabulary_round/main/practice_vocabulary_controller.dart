import 'dart:math';
import 'dart:ui';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../../data/models/word.dart';

class PracticeVocabularyController extends GetxController{
  int indexAnswer = 0;
  String typeQuestion = 'string';
  int sttQuestion = 1;
  int nextRound = 5;
  int numberOfRounds = 7;
  Map<String,dynamic> roundStatus = Map<String,dynamic>();
  String wordTopicName = '';
  List<WordModel> roundVocabulary = [];

  int indexQuestion = -1;
  List<Map<String,dynamic>> saveResult = [];
  List<Map<String,dynamic>> listRoundExam = [];
  String question = "";
  String imageQuestion = "";
  bool isImage = false;
  String answer1 = "";
  String answer2= "";
  String answer3= "";
  String answer4= "";
  Map<String,dynamic> currentQuestion =  Map<String,dynamic>();
  int correctAnswert = 0;
  int numTrue = 0;


  @override
  void onInit() async {
    super.onInit();
    var args = Get.arguments;
    roundStatus = args['roundStatus'];
    wordTopicName = args['wordTopicName'];
    roundVocabulary = args['roundVocabulary'];
    initExam();
    update();
  }
  void initExam() {
    indexQuestion = -1;
    saveResult = [];

    shuffleList(roundVocabulary);
    var random = Random();
    roundVocabulary.forEach((word) {
      List otherWords = roundVocabulary.map((item) => ({
        "wrongId": item.id,
        "wrongName": item.name,
        "wrongMean": item.mean,
      })).toList();
      otherWords.removeWhere((item) => item["wrongId"] == word.id);

      int indexRandomWrongWord1 = random.nextInt(otherWords.length);
      int indexRandomWrongWord2 = (indexRandomWrongWord1+1)%9;
      int indexRandomWrongWord3 = (indexRandomWrongWord1+2)%9;


      Map<String,dynamic> mp = {
        "id": word.id,
        "typeQuestion": random.nextInt(5),
        "wordName": word.name,
        "wordMean": word.mean,
        "spelling": word.phonetic,
        "wordType": word.wordType,
        "image": word.image,
        "wrongName1": otherWords[indexRandomWrongWord1]['wrongName'],
        "wrongMean1": otherWords[indexRandomWrongWord1]['wrongMean'],
        "wrongName2": otherWords[indexRandomWrongWord2]['wrongName'],
        "wrongMean2": otherWords[indexRandomWrongWord2]['wrongMean'],
        "wrongName3": otherWords[indexRandomWrongWord3]['wrongName'],
        "wrongMean3": otherWords[indexRandomWrongWord3]['wrongMean'],
        "isTrue": false,
      };
      listRoundExam.add(mp);
    });
    nextQuestion();
  }
  void setIndexAnswer(index) {
    indexAnswer = index;
    update();
  }


  void nextQuestion() {
    String tmp = '';
    switch (indexAnswer) {
      case 1:
        tmp = answer1;
        break;
      case 2:
        tmp = answer2;
        break;
      case 3:
        tmp = answer3;
        break;
      case 4:
        tmp = answer4;
        break;
    }
    if (indexQuestion>=0) saveResult[indexQuestion]['answer'] = tmp;
    indexQuestion++;
    if (indexQuestion > 9) {

      numTrue = saveResult.where((element) => element['answer'] == element['correctAnswer']).toList().length;
      Get.offAndToNamed(AppRoutes.RESULT_VOCABULARY_PAGE);


      return;
    }
    currentQuestion = listRoundExam[indexQuestion];

    configQuestion();
  }
  void configQuestion() {

    var random = Random();
    int indexCorrect = random.nextInt(4);
    if (currentQuestion["typeQuestion"] == 0) {
      isImage = false;
      question = currentQuestion?['wordName'] + '(${currentQuestion?['wordType']})';

      if (indexCorrect==0) {
        answer1 = currentQuestion?['wordMean'];
        answer2 = currentQuestion?['wrongMean1'];
        answer3 = currentQuestion?['wrongMean2'];
        answer4 = currentQuestion?['wrongMean3'];
      }
      else if (indexCorrect==1) {
        answer1 = currentQuestion?['wrongMean1'];
        answer2 = currentQuestion?['wordMean'];
        answer3 = currentQuestion?['wrongMean2'];
        answer4 = currentQuestion?['wrongMean3'];
      }
      else if (indexCorrect==2) {
        answer1 = currentQuestion?['wrongMean1'];
        answer2 = currentQuestion?['wrongMean2'];
        answer3 = currentQuestion?['wordMean'];
        answer4 = currentQuestion?['wrongMean3'];
      }
      else if (indexCorrect == 3) {
        answer1 = currentQuestion?['wrongMean1'];
        answer2 = currentQuestion?['wrongMean2'];
        answer3 = currentQuestion?['wrongMean3'];
        answer4 = currentQuestion?['wordMean'];
      }

    }
    else if (currentQuestion["typeQuestion"] == 1){
      question = currentQuestion?['wordMean'];
      isImage = false;
      if (indexCorrect==0) {
        answer1 = currentQuestion?['wordName'];
        answer2 = currentQuestion?['wrongName1'];
        answer3 = currentQuestion?['wrongName2'];
        answer4 = currentQuestion?['wrongName3'];
      }
      else if (indexCorrect==1) {
        answer1 = currentQuestion?['wrongName1'];
        answer2 = currentQuestion?['wordName'];
        answer3 = currentQuestion?['wrongName2'];
        answer4 = currentQuestion?['wrongName3'];
      }
      else if (indexCorrect==2) {
        answer1 = currentQuestion?['wrongName1'];
        answer2 = currentQuestion?['wrongName2'];
        answer3 = currentQuestion?['wordName'];
        answer4 = currentQuestion?['wrongName3'];
      }
      else if (indexCorrect == 3) {
        answer1 = currentQuestion?['wrongName1'];
        answer2 = currentQuestion?['wrongName2'];
        answer3 = currentQuestion?['wrongName3'];
        answer4 = currentQuestion?['wordName'];
      }
    }
    else {
      question = currentQuestion['wordMean'];
      imageQuestion = currentQuestion['image'];
      isImage = true;
      if (indexCorrect==0) {
        answer1 = currentQuestion?['wordName'] + '(${currentQuestion?['wordType']})';
        answer2 = currentQuestion?['wrongName1'] + '(${currentQuestion?['wordType']})';
        answer3 = currentQuestion?['wrongName2'] + '(${currentQuestion?['wordType']})';
        answer4 = currentQuestion?['wrongName3'] + '(${currentQuestion?['wordType']})';
      }
      else if (indexCorrect==1) {
        answer1 = currentQuestion?['wrongName1'] + '(${currentQuestion?['wordType']})';
        answer2 = currentQuestion?['wordName'] + '(${currentQuestion?['wordType']})';
        answer3 = currentQuestion?['wrongName2'] + '(${currentQuestion?['wordType']})';
        answer4 = currentQuestion?['wrongName3'] + '(${currentQuestion?['wordType']})';
      }
      else if (indexCorrect==2) {
        answer1 = currentQuestion?['wrongName1'] + '(${currentQuestion?['wordType']})';
        answer2 = currentQuestion?['wrongName2'] + '(${currentQuestion?['wordType']})';
        answer3 = currentQuestion?['wordName']+ '(${currentQuestion?['wordType']})';
        answer4 = currentQuestion?['wrongName3']+ '(${currentQuestion?['wordType']})';
      }
      else if (indexCorrect == 3) {
        answer1 = currentQuestion?['wrongName1'] + '(${currentQuestion?['wordType']})';
        answer2 = currentQuestion?['wrongName2'] + '(${currentQuestion?['wordType']})';
        answer3 = currentQuestion?['wrongName3'] + '(${currentQuestion?['wordType']})';
        answer4 = currentQuestion?['wordName'] + '(${currentQuestion?['wordType']})';
      }
    }

    correctAnswert = ++indexCorrect;
    String tmp ='';
    switch (correctAnswert) {
      case 1:
        tmp = answer1;
        break;
      case 2:
        tmp = answer2;
        break;
      case 3:
        tmp = answer3;
        break;
      case 4:
        tmp = answer4;
        break;
    }
    saveResult.add({
      "question": question,
      "questionImage": imageQuestion,
      "isImage": isImage,
      "correctAnswer": tmp
    });
    indexAnswer = 0;
    update();

  }

  void handleContinue() {
    if (numTrue/roundVocabulary.length<0.8) {
      Get.back();
    }
  }
  void shuffleList<T>(List<T> list) {
    final random = Random();
    for (var i = list.length - 1; i > 0; i--) {
      final j = random.nextInt(i + 1);
      final temp = list[i];
      list[i] = list[j];
      list[j] = temp;
    }
  }
}