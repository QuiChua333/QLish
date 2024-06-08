import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../../data/models/word.dart';

class LearningVocabularyRoundController extends GetxController{
  int indexAnswer = 0;
  String typeQuestion = 'string';
  int sttQuestion = 1;
  int nextRound = 5;
  int numberOfRounds = 7;
  Map<String,dynamic> roundStatus = Map<String,dynamic>();
  String wordTopicName = '';
  List<WordModel> roundVocabulary = [];
  final SpeechToText speechToText = SpeechToText();
  FlutterTts flutterTts = FlutterTts();

  bool speedEnable = false;
  String wordSpoken = '';
  double confidenceLevel = 0;

  @override
  void onInit() async {
    super.onInit();
    var args = Get.arguments;
    roundStatus = args['roundStatus'];
    wordTopicName = args['wordTopicName'];
    roundVocabulary = args['roundVocabulary'];
     initSpeech();
    update();
  }

  void initSpeech () async {
    speedEnable = await speechToText.initialize();
    update();

  }

  void startListening() async {
    await speechToText.listen(onResult: _onSpeechResult);
    confidenceLevel = 0;
    update();
  }
  void stopListening() async {
    await speechToText.stop();
    await speechToText.listen(onResult: _onSpeechResult);
  }

  void _onSpeechResult(result) {
    wordSpoken = '${result.recognizedWords}';
    if (wordSpoken!='' && wordSpoken != null) wordSpoken = wordSpoken.toLowerCase();
    confidenceLevel = result.confidence;
    update();
  }

  Future speak(String text) async{
    var result = await flutterTts.speak(text);
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

  void resetSpoken() {
    wordSpoken = '';
    update();
  }
}