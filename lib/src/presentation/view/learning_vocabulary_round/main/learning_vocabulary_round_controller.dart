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
  List<String?> listIdSpell = [];

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
    roundVocabulary[4] = WordModel( id: 'rkIIwg5Q2S5ZjtO2Pe0e',name: 'bedroom', mean: 'phòng ngủ', phonetic: '/ˈbed.ruːm/', wordType: 'n', wordTopicId: '0vGgR7QLVisr6XctyKVs', image: 'https://t3.ftcdn.net/jpg/01/30/99/06/360_F_130990691_zBt04IcjNvpIkprIPnlANvFcIFUx0Hcq.jpg');
     initSpeech();
    update();
  }

  void initSpeech () async {
    speedEnable = await speechToText.initialize();
    update();

  }

  void startListening() async {
    await speechToText.listen(onResult: _onSpeechResult,  localeId: 'en_US' );
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
    flutterTts.setLanguage('en');
    var result = await flutterTts.speak(text);
  }

  void setIndexAnswer(index) {
    indexAnswer = index;
    update();
  }
  void setSpellTrue(String? wordId) {
    if (!listIdSpell.contains(wordId)) listIdSpell.add(wordId);
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