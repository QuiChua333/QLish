import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/core/utils/repository/authentication_repository/authentication_repository.dart';
import 'package:qlish/src/presentation/component/button/button.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/intro.png',
                width: 400,
                height: 400,
                fit: BoxFit.contain,
              ),
              const Text(
                "Học Tiếng Anh",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
              ),
              const Text(
                "dễ dàng và đơn giản",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
              ),
              const SizedBox(
                height: 36,
              ),
              const Text("Cánh cửa giúp bạn thành thạo tiếng anh"),
              const Text("một cách dễ dàng và hiệu quả"),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.only(top: 48),
                child: CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.SIGNUP);
                  },
                  text: 'Đăng ký',
                  textWeight: FontWeight.w700,
                  textColor: Color(0xffF3AE29),
                  borderRadius: 40,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.only(top: 24),
                child: CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.SIGNIN);
                  },
                  text: 'Tôi đã có tài khoản',
                  textWeight: FontWeight.w700,
                  backgroundColor: Color(0xffE6E6E6),
                  borderRadius: 40,
                ),
              ),
            ],
          )),
    ));
  }
}
