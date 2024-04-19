import 'package:get/get.dart';

import 'signup_controller.dart';



class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}