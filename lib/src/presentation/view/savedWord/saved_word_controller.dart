import 'dart:convert';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/repository/savedword_repository/SavedWordRepository.dart';
import 'package:qlish/src/core/utils/repository/wordLearn_repository/WordLearnRepository.dart';
import 'package:qlish/src/data/models/word.dart';
import 'package:qlish/src/data/models/wordTopicWithSavedCount%20.dart';
import 'package:translator/translator.dart';


import 'package:http/http.dart' as http;

import '../../../data/models/wordLearnt.dart';
import '../../../data/models/wordTopic.dart';
import '../../../data/models/wordTopicWithLearntCount .dart';


class SavedWordController extends GetxController {
  FlutterTts flutterTts = FlutterTts();
  List<WordTopicWithSavedCount> wordTopicWithSavedCounts = [];
  int indexTopicActive = -1;
  int count = 0;
  List<WordModel> listWordsSavedByTopic = [];
  List<WordModel> listWordsSavedByTopicOrigin = [];
  String topicImage = '';
  String topicName = '';
  final wordSavedRepo = Get.put(SavedWordRepository());
  bool isLoading = true;

  @override
  void onInit() async {
    super.onInit();
     isLoading = true;
    await getAllWordTopicSaved();
    isLoading = false;
    update();

  }

  Future speak(String text) async{
    flutterTts.setLanguage('en');
    await flutterTts.speak(text);
  }

  void setIndexActive(index) {
    topicImage = wordTopicWithSavedCounts[index].wordTopic.image;
    topicName = wordTopicWithSavedCounts[index].wordTopic.wordTopicName;
    count = wordTopicWithSavedCounts[index].listWords.length;
    listWordsSavedByTopic = List.from(wordTopicWithSavedCounts[index].listWords);
    listWordsSavedByTopicOrigin = List.from(wordTopicWithSavedCounts[index].listWords);

  }

  Future<void> getAllWordTopicSaved() async {
    wordTopicWithSavedCounts = await wordSavedRepo.getWordTopicsWithSavedCount();
  }
  void handleChange(String search) {
    if (search.trim()=='') listWordsSavedByTopic = List.from(listWordsSavedByTopicOrigin);
    listWordsSavedByTopic = listWordsSavedByTopicOrigin.where((element) => element.name.toString().toLowerCase().contains(search.toLowerCase())).toList();
    update();
  }






}