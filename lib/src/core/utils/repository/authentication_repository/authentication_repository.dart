import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/core/utils/repository/authentication_repository/exceptions/signin_email_password_failure.dart';
import 'package:qlish/src/core/utils/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:qlish/src/core/utils/repository/user_repository/UserRepository.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/user.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _userRepo = Get.put(UserRepository());

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 8  ));
    firebaseUser =  Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);
    setInitialScreen(firebaseUser.value);
  }

  setInitialScreen(User? user) async {
    if (user == null) {
      Get.offAllNamed(AppRoutes.INTRO);
    }
    else {
      if (user.emailVerified) {
        UserModel userModel = await _userRepo.getUserDetail(user.email!);
        ToastMessage.show('Đăng ký và xác minh thành công', ToastMessage.SUCCESS);
        if (!userModel.isTested) {
          Get.offAllNamed(AppRoutes.PRE_TEST);
        }
        else {
          Get.offAllNamed(AppRoutes.DASHBOARD);
        }

      }
      else {
        Get.toNamed(AppRoutes.EMAIL_VERIFY);
      }
    }

  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
        ToastMessage.show(ex.message, ToastMessage.ERROR);
      throw ex;
    } catch (_) {
      final ex = SignUpEmailAndPasswordFailure();
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      ToastMessage.show(ex.message, ToastMessage.ERROR);
      throw ex;
    }

  }
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      setInitialScreen(_auth.currentUser);
    } on FirebaseAuthException catch (e) {
      final ex = SignInEmailAndPasswordFailure.code(e.code);
      ToastMessage.show(ex.message, ToastMessage.ERROR);
    } catch (_) {
      final ex = SignUpEmailAndPasswordFailure();
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      ToastMessage.show(ex.message, ToastMessage.ERROR);
      throw ex;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    setInitialScreen(_auth.currentUser);
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    }

    catch (e){
      print(e.toString());
    }
  }
  Future<void> sendPasswordResetLink(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    }
    catch (e){
      print(e.toString());
    }
  }
}