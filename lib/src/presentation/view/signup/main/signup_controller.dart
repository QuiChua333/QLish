import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/repository/authentication_repository/authentication_repository.dart';
import 'package:qlish/src/core/utils/repository/user_repository/UserRepository.dart';
import 'package:qlish/src/data/models/user.dart';

class SignUpController extends GetxController{
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> registerUser(String email, String password) async {
    final auth =  AuthenticationRepository.instance;
    await auth.createUserWithEmailAndPassword(email, password);

  }

  void createUser(UserModel user) async {
    final auth =  AuthenticationRepository.instance;
    await registerUser(user.email, user.password);
    await userRepo.createUser(user);
    auth.setInitialScreen(auth.firebaseUser.value);
  }




}