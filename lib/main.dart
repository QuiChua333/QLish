import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/core/utils/constants/app_pages.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Learning English",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme:
          const ColorScheme.light(background: Colors.white),
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColors.mainBackground,
          primaryColor: AppColors.mainColor,
          appBarTheme: AppBarTheme(
              backgroundColor: AppColors.mainBackground,
              titleTextStyle: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              )
          ),
          textTheme: TextTheme(
              bodyLarge: TextStyle(color: AppColors.textColor),
              bodyMedium: TextStyle(color: AppColors.textColor, fontSize: 14),
          )
      ),
      initialRoute: AppRoutes.LEARNING_VOCABULARY_ROUND,
      getPages: AppPages.pages,
    );
  }
}


