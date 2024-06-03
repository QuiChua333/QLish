import 'package:get/get.dart';
import 'package:qlish/src/core/utils/repository/authentication_repository/authentication_repository.dart';
import 'package:qlish/src/core/utils/repository/user_repository/UserRepository.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/user.dart';

class HomeController extends GetxController {
  final _userRepo = Get.put(UserRepository());
  late UserModel user = UserModel(email: '', name: '', id: '', password: '');

  @override
  void onInit() async {
    super.onInit();
    await getUserData();
    update();

  }

  Future<void> getUserData() async {
    final email = AuthenticationRepository.instance.firebaseUser.value?.email;
    if (email != null) {
       user = await _userRepo.getUserDetail(email);
    }
    else ToastMessage.show('Error', ToastMessage.ERROR);

  }
}