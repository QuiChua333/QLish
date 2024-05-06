import 'package:get/get.dart';

import 'learning_vocabulary_controller.dart';

class LearningVocabularyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearningVocabularyController>(() => LearningVocabularyController());
  }
}