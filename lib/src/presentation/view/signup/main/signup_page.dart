import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/core/utils/firebase/firebase_auth_service.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/core/utils/validation/Validate.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/component/input/input_password.dart';
import 'package:qlish/src/presentation/component/input/normal_input.dart';

import 'signup_controller.dart';




class SignUpPage extends StatelessWidget{
  SignUpPage({super.key});
  SignUpController controller = Get.find<SignUpController>();
  // FirebaseAuthService _auth = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return  GetBuilder<SignUpController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                surfaceTintColor: Colors.transparent,
                title: Text('Đăng ký'),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 32, right: 32, bottom: 30),
                  width: Get.width,
                  child: Column(
                    children: [
                      const Text('Q', style: TextStyle(fontSize:60,color: Color(0xffFFBA1A), fontFamily: 'Rowdies', fontWeight: FontWeight.w700),),
                      const Text('LISH', style: TextStyle(fontSize: 60,color: Color(0xffFFBA1A), fontFamily: 'Rowdies', fontWeight: FontWeight.w700, height: 1),),
                      Container(
                        margin: EdgeInsets.only(top: Get.height*0.05),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text('Họ và tên', style: TextStyle(),)
                                    ),
                                  ),
                                  NormalInput(
                                    controller: controller.fullName, hint: "Nhập họ tên", borderRadius: 24, paddingV: 10,
                                    validator: (string) {
                                      return Validate.validateEmpty(string,'họ tên');
                                    },
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
                                    controller: controller.email, hint: "Nhập email", borderRadius: 24, paddingV: 10,
                                    validator: (string) {
                                      return Validate.validateEmail(string);
                                    },
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
                                    controller: controller.password, hint: "Nhập mật khẩu", borderRadius: 24, paddingV: 10,
                                    validator: (string) {
                                      return Validate.validatePassword(string);
                                    },
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
                                    controller: controller.confirmPassword, hint: "Nhập lại mật khẩu", borderRadius: 24, paddingV: 10,
                                    validator: (string) {
                                      final error = Validate.validateEmpty(string,'mật khẩu');
                                      if (error!=null) return error;
                                      if (string != controller.password.text) return 'Mật khẩu không trùng khớp';
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Get.height*0.05),
                        child: Column(
                          children: [
                            Container(
                              child: CustomButton(
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    String email = controller.email.text.trim();
                                    String password = controller.password.text.trim();
                                    // User? user = await _auth.signUpWithEmailAndPassword(email, password);
                                    // if (user!=null) {
                                    //   ToastMessage.show('Đăng ký thành công!', ToastMessage.SUCCESS);
                                    //   Future.delayed(const Duration(seconds: 1), () {
                                    //   });
                                    //
                                    //
                                    // }
                                    // else print('Some error happen');
                                    controller.registerUser(email, password);

                                  }
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