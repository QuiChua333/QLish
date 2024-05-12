import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/repository/authentication_repository/authentication_repository.dart';

class SignInController extends GetxController{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> signIn(String email, String password) async {
    await AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
  }
}