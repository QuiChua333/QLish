import 'package:get/get.dart';
import 'package:qlish/src/presentation/view/emailVerify/main/email_verify_controller.dart';

class EmailVerifyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailVerifyController>(() => EmailVerifyController());
  }
}