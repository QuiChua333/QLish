import 'package:get/get.dart';
import 'package:qlish/src/core/utils/repository/authentication_repository/authentication_repository.dart';
import 'package:qlish/src/core/utils/repository/user_repository/UserRepository.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/user.dart';

class DetailRankController extends GetxController {
  final _userRepo = UserRepository.instance;
  List<UserModel> users = [];
  List<UserModel> top3Users = [];
  List<UserModel> remainingUsers = [];
  @override
  void onInit() async {
    super.onInit();
    await getListUser();
    print(users);
    update();

  }

  Future<void> ref() async {
    await getListUser();
    update();
  }

  Future<void> getListUser() async {
    users = await _userRepo.getListUser();
    users.sort((a, b) => b.score.compareTo(a.score));
    top3Users = users.length >= 3 ? users.sublist(0, 3) : users;
     remainingUsers = users.length > 3 ? users.sublist(3) : [];
  }

}