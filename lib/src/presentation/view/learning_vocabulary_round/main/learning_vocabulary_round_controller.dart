import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/repository/savedword_repository/SavedWordRepository.dart';
import 'package:qlish/src/core/utils/repository/user_repository/UserRepository.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../../data/models/word.dart';

class LearningVocabularyRoundController extends GetxController{
  final saveWordRepo = Get.put(SavedWordRepository());
  final userRepo = UserRepository.instance;
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
  List<String?> listIdSave = [];

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
    // roundVocabulary[4] = WordModel( id: 'rkIIwg5Q2S5ZjtO2Pe0e',name: 'bedroom', mean: 'phòng ngủ', phonetic: '/ˈbed.ruːm/', wordType: 'n', wordTopicId: '0vGgR7QLVisr6XctyKVs', image: 'https://t3.ftcdn.net/jpg/01/30/99/06/360_F_130990691_zBt04IcjNvpIkprIPnlANvFcIFUx0Hcq.jpg');
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
  Future<void> setSpellTrue(String? wordId) async {
    if (!listIdSpell.contains(wordId)) {
      listIdSpell.add(wordId);
      await userRepo.addStar(type: 'word');
      update();
    }
  }
  void nextQuestion() {
    sttQuestion++;
    if (sttQuestion>10) sttQuestion=1;
    update();
  }

  Future<void> saveWord(String? wordId) async{
    if (!listIdSave.contains(wordId)) {
      listIdSave.add(wordId);
      await saveWordRepo.savedWord(wordId);

    }
    else {
      await saveWordRepo.unSavedWord(wordId);
       listIdSave.remove(wordId);
    }
    update();

  }

  void resetSpoken() {
    wordSpoken = '';
    update();
  }
}