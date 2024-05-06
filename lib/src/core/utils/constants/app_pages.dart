import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/presentation/view/change_name/main/change_name_page.dart';
import 'package:qlish/src/presentation/view/change_password/main/change_password_page.dart';
import 'package:qlish/src/presentation/view/detail_rank/main/detail_rank_page.dart';
import 'package:qlish/src/presentation/view/edit_profile/main/edit_profile_page.dart';
import 'package:qlish/src/presentation/view/emailVerify/email_verify_page.dart';
import 'package:qlish/src/presentation/view/ipa/main/ipa_page.dart';
import 'package:qlish/src/presentation/view/learning_sentence/main/learning_sentence_page.dart';
import 'package:qlish/src/presentation/view/learning_sentence_round/main/learning_sentence_binding.dart';
import 'package:qlish/src/presentation/view/learning_sentence_round/main/learning_sentence_round_page.dart';
import 'package:qlish/src/presentation/view/learning_sentence_round/main/practice_sentence_page.dart';
import 'package:qlish/src/presentation/view/learning_sentence_round/main/result_sentence_page.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary/main/learning_vocabulary_page.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary_round/main/learning_vocabulary_binding.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary_round/main/learning_vocabulary_round_page.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary_round/main/practice_vocabulary_page.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary_round/main/result_vocabulary_page.dart';
import 'package:qlish/src/presentation/view/navigation_menu/navigation_menu.dart';
import 'package:qlish/src/presentation/view/overview_profile/main/overview_profile_page.dart';
import 'package:qlish/src/presentation/view/overview_rank/main/overview_rank_page.dart';
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

    GetPage(
      name: AppRoutes.OVERVIEW_PROFILE,
      page: () => OverviewProfilePage(),
    ),
    GetPage(
      name: AppRoutes.EDIT_PROFILE,
      page: () => EditProfilePage(),
    ),
    GetPage(
      name: AppRoutes.CHANGE_PASSWORD,
      page: () => ChangePasswordPage(),
    ),
    GetPage(
      name: AppRoutes.CHANGE_NAME,
      page: () => ChangeNamePage(),
    ),
    GetPage(
      name: AppRoutes.BOTTOM_NAVIGATION,
      page: () => NavigationMenu(),
    ),
    GetPage(
      name: AppRoutes.IPA,
      page: () => IPAPage(),
    ),
    GetPage(
      name: AppRoutes.LEARNING_VOCABULARY,
      page: () => LearningVocabularyPage(),
    ),
    GetPage(
      name: AppRoutes.LEARNING_VOCABULARY_ROUND,
      page: () => LearningVocabularyRoundPage(),
    ),
    GetPage(
      name: AppRoutes.PRACTICE_VOCABULARY,
      page: () => PracticeVocabularyPage(),
      binding: LearningVocabularyBinding()
    ),
    GetPage(
      name: AppRoutes.RESULT_VOCABULARY_PAGE,
      page: () => ResultVocabularyPage(),
    ),

    GetPage(
      name: AppRoutes.LEARNING_SENTENCE,
      page: () => LearningSentencePage(),
    ),
    GetPage(
      name: AppRoutes.LEARNING_SENTENCE_ROUND,
      page: () => LearningSentenceRoundPage(),
    ),
    GetPage(
        name: AppRoutes.PRACTICE_SENTENCE,
        page: () => PracticeSentencePage(),
        binding: LearningSentenceBinding()
    ),
    GetPage(
      name: AppRoutes.RESULT_SENTENCE_PAGE,
      page: () => ResultSentencePage(),
    ),


    GetPage(
      name: AppRoutes.OVERVIEW_RANK,
      page: () => OverviewRankPage(),
    ),

    GetPage(
      name: AppRoutes.DETAIL_RANK,
      page: () => DetailRankPage(),
    ),

  ];
}