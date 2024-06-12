import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/core/utils/repository/test_repository/TestRepository.dart';
import 'package:qlish/src/core/utils/repository/user_repository/UserRepository.dart';
import 'package:qlish/src/core/utils/repository/wordLearn_repository/WordLearnRepository.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qlish/src/data/models/test.dart';

import '../../../../data/models/word.dart';
import '../../../../data/models/wordLearnt.dart';
import '../../../component/dialog/dialog.dart';

class TestController extends GetxController{
  final testRepo = Get.put(TestRepository());
  int indexAnswer = 0;
  String typeQuestion = 'string';
  Map<String,dynamic> roundStatus = Map<String,dynamic>();
  String wordTopicName = '';
  List<TestModel> roundVocabulary = [];

  int indexQuestion = -1;
  List<Map<String,dynamic>> saveResult = [];
  List<Map<String,dynamic>> listRoundExam = [];
  String question = "";
  String imageQuestion = "";
  bool isImage = false;
  String answer1 = "";
  String answer2= "";
  Map<String,dynamic> currentQuestion =  Map<String,dynamic>();
  int correctAnswert = 0;
  int numTrue = 0;


  @override
  void onInit() async {
    super.onInit();
    await getListTest();
    initExam();
    update();
  }

  Future<void> getListTest() async {
    roundVocabulary = await testRepo.getListTest();
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


  Future<void> nextQuestion([BuildContext? context]) async{
    String tmp = '';
    switch (indexAnswer) {
      case 1:
        tmp = answer1;
        break;
      case 2:
        tmp = answer2;
        break;
    }
    if (indexQuestion>=0) saveResult[indexQuestion]['answer'] = tmp;
    indexQuestion++;
    if (indexQuestion > listRoundExam.length - 1) {

      numTrue = saveResult.where((element) => element['answer'] == element['correctAnswer']).toList().length;
      if (numTrue >= 5) {
        await UserRepository.instance.changeTestSuccess(level: 2);
      }
      else {
        await UserRepository.instance.changeTestSuccess(level: 1);
      }
      showDialog(context: context!, builder: (context) =>  CustomDialog(title: 'Thông báo',
        content: 'Chúc mừng hoàn thành bài test với kết quả ${numTrue}/${listRoundExam.length}, bạn sẽ khởi đầu với độ khó phù hợp',
        contentOk: 'Tiếp tục',
        onTap: () {
          Get.offAllNamed(AppRoutes.DASHBOARD);
        },));


      return;
    }
    currentQuestion = listRoundExam[indexQuestion];

    configQuestion();
  }
  void configQuestion() {

    var random = Random();
    int indexCorrect = random.nextInt(2);
    if (currentQuestion["typeQuestion"] == 0) {
      isImage = false;
      question = currentQuestion?['wordName'] + '(${currentQuestion?['wordType']})';

      if (indexCorrect==0) {
        answer1 = currentQuestion?['wordMean'];
        answer2 = currentQuestion?['wrongMean1'];
      }
      else if (indexCorrect==1) {
        answer1 = currentQuestion?['wrongMean1'];
        answer2 = currentQuestion?['wordMean'];
      }


    }
    else if (currentQuestion["typeQuestion"] == 1){
      question = currentQuestion?['wordMean'];
      isImage = false;
      if (indexCorrect==0) {
        answer1 = currentQuestion?['wordName'];
        answer2 = currentQuestion?['wrongName1'];
      }
      else if (indexCorrect==1) {
        answer1 = currentQuestion?['wrongName1'];
        answer2 = currentQuestion?['wordName'];
      }

    }
    else {
      question = currentQuestion['wordMean'];
      imageQuestion = currentQuestion['image'];
      isImage = true;
      if (indexCorrect==0) {
        answer1 = currentQuestion?['wordName'] + '(${currentQuestion?['wordType']})';
        answer2 = currentQuestion?['wrongName1'] + '(${currentQuestion?['wordType']})';
      }
      else if (indexCorrect==1) {
        answer1 = currentQuestion?['wrongName1'] + '(${currentQuestion?['wordType']})';
        answer2 = currentQuestion?['wordName'] + '(${currentQuestion?['wordType']})';
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

  Future<void> handleContinue() async{
    Get.offAllNamed(AppRoutes.DASHBOARD);

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