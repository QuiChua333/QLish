import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/view/home/main/home_binding.dart';
import 'package:qlish/src/view/home/main/home_page.dart';
import 'package:qlish/src/view/splash/main/splash_page.dart';

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
  ];
}