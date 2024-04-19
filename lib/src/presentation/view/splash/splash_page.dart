import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';

class SplashPage extends StatefulWidget {
  SplashPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return  _SplashPageState();
  }

}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed(AppRoutes.HOME);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xff1D3B50),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Q', style: TextStyle(fontSize: 80,color: Color(0xffFFBA1A), fontFamily: 'Rowdies', fontWeight: FontWeight.w700),),
              Text('LISH', style: TextStyle(fontSize: 80,color: Color(0xffFFBA1A), fontFamily: 'Rowdies', fontWeight: FontWeight.w700, height: 1),),
            ],
          )
      )
    );
  }

}

