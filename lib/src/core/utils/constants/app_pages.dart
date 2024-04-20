import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/presentation/view/emailVerify/email_verify_page.dart';
import 'package:qlish/src/presentation/view/signin.main/signin_binding.dart';
import 'package:qlish/src/presentation/view/signin.main/signin_page.dart';
import 'package:qlish/src/presentation/view/signup/main/signup_binding.dart';
import 'package:qlish/src/presentation/view/signup/main/signup_page.dart';

import '../../../presentation/view/home/main/home_binding.dart';
import '../../../presentation/view/home/main/home_page.dart';
import '../../../presentation/view/intro/intro_page.dart';
import '../../../presentation/view/splash/splash_page.dart';


class AppPages {
  static List<GetPage> pages = [
    GetPage(
        name: AppRoutes.HOME,
        page: () => HomePage(),
        binding: HomeBinding()
    ),
    GetPage(
        name: AppRoutes.SPLASH,
        page: () => SplashPage(),
    ),
    GetPage(
      name: AppRoutes.INTRO,
      page: () => IntroPage(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => SignUpPage(),
      binding: SignUpBinding()
    ),
    GetPage(
      name: AppRoutes.SIGNIN,
      page: () => SignInPage(),
      binding: SignInBinding()
    ),
    GetPage(
      name: AppRoutes.EMAIL_VERIFY,
      page: () => EmailVerifyPage(),
    ),
  ];
}