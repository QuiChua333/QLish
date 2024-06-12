import 'dart:convert';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/repository/wordLearn_repository/WordLearnRepository.dart';
import 'package:qlish/src/data/models/word.dart';
import 'package:translator/translator.dart';


import 'package:http/http.dart' as http;

import '../../../data/models/wordLearnt.dart';
import '../../../data/models/wordTopic.dart';
import '../../../data/models/wordTopicWithLearntCount .dart';


class LearntWordController extends GetxController {
  FlutterTts flutterTts = FlutterTts();
  List<WordTopicWithLearntCount> wordTopicWithLearntCounts = [];
  int indexTopicActive = -1;
  int count = 0;
  List<WordModel> listWordsLearnByTopic = [];
  List<WordModel> listWordsLearnByTopicOrigin = [];
  String topicImage = '';
  String topicName = '';
  final wordLearntRepo = Get.put(WordLearnRepository());
  bool isLoading = true;

  @override
  void onInit() async {
    super.onInit();
     isLoading = true;
    await getAllWordTopicLearnt();
    isLoading = false;
    update();

  }

  Future speak(String text) async{
    flutterTts.setLanguage('en');
    await flutterTts.speak(text);
  }

  void setIndexActive(index) {
    topicImage = wordTopicWithLearntCounts[index].wordTopic.image;
    topicName = wordTopicWithLearntCounts[index].wordTopic.wordTopicName;
    count = wordTopicWithLearntCounts[index].listWords.length;
    listWordsLearnByTopic = List.from(wordTopicWithLearntCounts[index].listWords);
    listWordsLearnByTopicOrigin = List.from(wordTopicWithLearntCounts[index].listWords);

  }

  Future<void> getAllWordTopicLearnt() async {
    wordTopicWithLearntCounts = await wordLearntRepo.getWordTopicsWithLearntCount();
  }
  void handleChange(String search) {
    if (search.trim()=='') listWordsLearnByTopic = List.from(listWordsLearnByTopicOrigin);
    listWordsLearnByTopic = listWordsLearnByTopicOrigin.where((element) => element.name.toString().toLowerCase().contains(search.toLowerCase())).toList();
    update();
  }






}