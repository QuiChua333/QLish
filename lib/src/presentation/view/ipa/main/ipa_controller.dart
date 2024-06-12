import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/repository/authentication_repository/authentication_repository.dart';
import 'package:qlish/src/core/utils/repository/ipa_repository/IPA.dart';
import 'package:qlish/src/core/utils/repository/user_repository/UserRepository.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/ipa.dart';
import 'package:qlish/src/data/models/user.dart';

class IPAController extends GetxController {
  final ipaRepository = Get.put(IPARepository());
  FlutterTts flutterTts = FlutterTts();
  final audioPlayer = AudioPlayer();

  List<IPAModel> ipas = [];
  List<IPAModel> ipans = [];
  List<IPAModel> ipaps = [];
  @override
  void onInit() async {
    super.onInit();
    await getListIPAs();
    update();

  }

  Future<void> getListIPAs() async {
    ipas = await ipaRepository.getLisIPAs();
    ipans = ipas.where((ipa) => ipa.type == 'n').toList()
      ..sort((a, b) => a.stt.compareTo(b.stt));
    ipaps = ipas.where((ipa) => ipa.type == 'p').toList()
      ..sort((a, b) => a.stt.compareTo(b.stt));

  }

  Future speak(String text) async{
    flutterTts.setLanguage('en');
    var result = await flutterTts.speak(text);
  }

  Future<void> audioPhonetic(String url) async {
    await audioPlayer.play(UrlSource(url));
  }

}