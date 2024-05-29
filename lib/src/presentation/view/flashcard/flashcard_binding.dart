
import 'package:get/get.dart';
import 'package:qlish/src/presentation/view/flashcard/flashcard_controller.dart';
class FlashCardBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FlashCardController>(() => FlashCardController());
  }
}