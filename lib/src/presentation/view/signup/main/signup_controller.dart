import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController{
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  Future<void> registerUser(String email, String password) async {
    final auth =  AuthenticationRepository.instance;
    await auth.createUserWithEmailAndPassword(email, password);
    auth.setInitialScreen(auth.firebaseUser.value);
  }




}