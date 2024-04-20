import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/component/input/input_password.dart';
import 'package:qlish/src/presentation/component/input/normal_input.dart';

import 'signup_controller.dart';




class SignUpPage extends StatelessWidget{
  SignUpPage({super.key});
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SignUpController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                // leading: IconButton(
                //   onPressed: () {
                //     Get.back();
                //   },
                //   icon: const Icon(Icons.arrow_back),
                // ),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                width: Get.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text('Q', style: TextStyle(fontSize:60,color: Color(0xffFFBA1A), fontFamily: 'Rowdies', fontWeight: FontWeight.w700),),
                      const Text('LISH', style: TextStyle(fontSize: 60,color: Color(0xffFFBA1A), fontFamily: 'Rowdies', fontWeight: FontWeight.w700, height: 1),),
                      Container(
                        margin: EdgeInsets.only(top: Get.height*0.05),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Tên đăng nhập', style: TextStyle(),)
                                  ),
                                ),
                                NormalInput(
                                  controller: usernameController, hint: "Nhập tên đăng nhập", borderRadius: 24, paddingV: 10,
                                ),
                              ],
                            ),
                            SizedBox(height: 16,),
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Email', style: TextStyle(),)
                                  ),
                                ),
                                NormalInput(
                                  controller: emailController, hint: "Nhập email", borderRadius: 24, paddingV: 10,
                                ),
                              ],
                            ),
                            SizedBox(height: 16,),
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Mật khẩu', style: TextStyle(),)
                                  ),
                                ),
                                InputPassword(
                                  controller: passwordController, hint: "Nhập mật khẩu", borderRadius: 24, paddingV: 10,
                                ),
                              ],
                            ),
                            SizedBox(height: 16,),
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Xác nhận mật khẩu', style: TextStyle(),)
                                  ),
                                ),
                                InputPassword(
                                  controller: confirmPasswordController, hint: "Nhập lại mật khẩu", borderRadius: 24, paddingV: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Get.height*0.05),
                        child: Column(
                          children: [
                            Container(
                              child: CustomButton(
                                onTap: () {
                                  Get.toNamed(AppRoutes.EMAIL_VERIFY);
                                },
                                text: 'Đăng ký',
                                textColor: Color(0xffF3AE29),
                                textWeight: FontWeight.w700,
                                borderRadius: 40,
                              ),
                            ),
                            SizedBox(height: 60,),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Bạn đã có tài khoản?", style: TextStyle(color: Color(0xff6f7480)),),
                                InkWell(
                                  onTap: () {
                                    Get.offNamed(AppRoutes.SIGNIN);
                                  },
                                    child: const Text(" Đăng nhập ngay", style: TextStyle(fontWeight: FontWeight.w500,color: Color(0xff008053)))
                                )
                              ],
                            )


                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
        );
      },
    );

  }


}