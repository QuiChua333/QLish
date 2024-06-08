import 'package:get/get.dart';

import 'learning_sentence_round_controller.dart';

class LearningSentenceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearningSentenceRoundController>(() => LearningSentenceRoundController());
  }
}