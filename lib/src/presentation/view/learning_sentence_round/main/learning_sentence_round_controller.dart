import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/repository/savedsentence_repository/SavedSentenceRepository.dart';
import 'package:qlish/src/core/utils/repository/sentenceLearn_repository/SentenceLearnRepository.dart';
import 'package:qlish/src/data/models/sentence.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/utils/repository/savedword_repository/SavedWordRepository.dart';
import '../../../../core/utils/repository/user_repository/UserRepository.dart';

class LearningSentenceRoundController extends GetxController{
  final saveSentenceRepo = Get.put(SavedSentenceRepository());
  final learntSentenceRepo = Get.put(SentenceLearnRepository());
  final userRepo = UserRepository.instance;
  int indexAnswer = 0;
  String typeQuestion = 'string';
  int sttQuestion = 1;
  late int? indexActive = -1;

  Map<String,dynamic> roundStatus = Map<String,dynamic>();
  SentenceModel roundSentence = SentenceModel(sentence: '', mean: '', video: '', startAt: 0);

  final SpeechToText speechToText = SpeechToText();
  FlutterTts flutterTts = FlutterTts();

  late YoutubePlayerController youtubeController;

  String sentenceSpoken = '';
  List<String?> listIdSpell = [];
  List<String?> listIdSave = [];
  bool speedEnable = false;
  double confidenceLevel = 0;


  @override
  void onInit() async {
    super.onInit();
    var args = Get.arguments;
    roundStatus = args['roundStatus'];
    roundSentence = args['roundSentence'];
    final videoId = YoutubePlayer.convertUrlToId(roundSentence.video);
    youtubeController = YoutubePlayerController(initialVideoId: videoId!,
    flags:  YoutubePlayerFlags(
      autoPlay: false,
      startAt: roundSentence.startAt,
    ));
    initSpeech();
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

  void replayVideo() {
    // Dừng video hiện tại (nếu đang phát)
    youtubeController.pause();

    // Tua lại video về thời gian bắt đầu (ở đây là 0)
    youtubeController.seekTo(Duration(seconds: roundSentence.startAt));

    // Phát lại video
    youtubeController.play();

  }

  Future<void> setSpellTrue(String? sentenceId) async {
    if (!listIdSpell.contains(sentenceId))  {
      listIdSpell.add(sentenceId);
      await userRepo.addStar(type: 'sentence');
      update();
    }
  }

  Future<void> saveSentence(String? sentenceId) async{
    if (!listIdSave.contains(sentenceId)) {
      listIdSave.add(sentenceId);
      await saveSentenceRepo.saveSentence(sentenceId);

    }
    else {
      await saveSentenceRepo.unSavedSentence(sentenceId);
      listIdSave.remove(sentenceId);
    }
    update();

  }
  void initSpeech () async {

    speedEnable = await speechToText.initialize();

    update();

  }

  void startListening() async {
    await speechToText.listen(onResult: _onSpeechResult, localeId: 'en_US');
    confidenceLevel = 0;
    update();
  }
  void stopListening() async {
    await speechToText.stop();
    await speechToText.listen(onResult: _onSpeechResult);
  }

  void _onSpeechResult(result) {
    sentenceSpoken = '${result.recognizedWords}';
    if (sentenceSpoken!='' && sentenceSpoken != null) sentenceSpoken = sentenceSpoken.toLowerCase();
    confidenceLevel = result.confidence;
    update();
  }

  Future speak(String text) async{
    flutterTts.setLanguage('en');
    var result = await flutterTts.speak(text);
  }

  Future<void> saveLearntSentence(String? sentenceId) async {
    await learntSentenceRepo.saveLearntSentenceToFirestore(sentenceId);
  }

}