import 'dart:convert';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';


import '../../../../data/models/word.dart';
import 'package:http/http.dart' as http;


class DictionaryController extends GetxController {
  final translator = GoogleTranslator();
  final searchController = TextEditingController();
  final audioPlayer = AudioPlayer();
  bool isShowDelete = false;
  String name = '';
  String wordType = '';
  var mean;
  String phonetic = '';
  String audio = '';
  List<String> type = [];
  bool isHasResult = false;
  Map<String,dynamic> wordResponse = Map<String,dynamic>();

  @override
  void onInit() async {
    super.onInit();

    update();

  }
  void handleSearch(text) {
    if (text!='') isShowDelete = true;
    else isShowDelete = false;
    update();
  }

  Future<void> search() async {
    type = [];
    var response = await fetchDictionary();
    name = response[0]['word'];
    wordType = response[0]['meanings'][0]['partOfSpeech'];
    for (int i = 0; i<response[0]['meanings'].length; i++) {
      if (response[0]['meanings'][i]['partOfSpeech'] != null && response[0]['meanings'][i]['partOfSpeech']!= '') {

        if (!type.contains(response[0]['meanings'][i]['partOfSpeech'])) {
          type.add(response[0]['meanings'][i]['partOfSpeech']);
        }
      }
    }
    wordType = type.join(', ');

    for (int i = 0; i<response[0]['phonetics'].length; i++) {
      if (response[0]['phonetics'][i]['text'] != null && response[0]['phonetics'][i]['text']!= '') {
        phonetic = response[0]['phonetics'][i]['text'];
        break;
      }
    }
    for (var entry in response[0]['phonetics']) {

      if (entry['text'] != null && entry['text']!= '') {
        phonetic = entry['text'];
        break;
      }
    }
    for (var entry in response[0]['phonetics']) {
      if (entry['audio'] != null && entry['audio']!= '') {

        audio = entry['audio'];
        break;
      }
    }
    var meanTranslation = await translator.translate("${name}", from: 'en', to: 'vi');
    mean = meanTranslation;
    update();

  }
  Future<void> audioPhonetic() async {
    print(audio);
    await audioPlayer.play(UrlSource(audio));
  }

  Future<dynamic> fetchDictionary() async {
    final response = await http
        .get(Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/${searchController.text}'));

    if (response.statusCode == 200) {

      // If the server did return a 200 OK response,
      // then parse the JSON.
      var result = (jsonDecode(response.body));
      isHasResult = true;
      return result;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      isHasResult = false;
      throw Exception('Failed to load album');
    }
  }




}