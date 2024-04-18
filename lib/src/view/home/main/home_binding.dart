import 'package:get/get.dart';
import 'package:qlish/src/view/home/main/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}