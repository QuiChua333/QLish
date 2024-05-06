import 'package:get/get.dart';

import 'learning_sentence_controller.dart';

class LearningSentenceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearningSentenceController>(() => LearningSentenceController());
  }
}