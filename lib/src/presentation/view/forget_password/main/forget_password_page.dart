import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/core/utils/repository/authentication_repository/authentication_repository.dart';
import 'package:qlish/src/core/utils/validation/Validate.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/component/input/normal_input.dart';
import 'package:qlish/src/presentation/view/emailVerify/main/email_verify_controller.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                width: Get.width,
                child: Column(
                  children: [
                    SizedBox(height: Get.height*0,),
                    const Text('Q', style: TextStyle(fontSize:70,color: Color(0xffFFBA1A), fontFamily: 'Rowdies', fontWeight: FontWeight.w700),),
                    const Text('LISH', style: TextStyle(fontSize: 70,color: Color(0xffFFBA1A), fontFamily: 'Rowdies', fontWeight: FontWeight.w700, height: 1),),
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
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
                                  validator: (string) {
                                    return Validate.validateEmail(string);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 24),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 24),
                                  child: CustomButton(
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        String email = emailController.text.trim();

                                        await AuthenticationRepository.instance.sendPasswordResetLink(email);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Một liên kết cập nhật mật khẩu đã được gửi đến email của bạn'))
                                        );


                                      }
                                    },
                                    text: 'Gửi email',
                                    textColor: const Color(0xffF3AE29),
                                    textWeight: FontWeight.w700,
                                    borderRadius: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Align(
                alignment:  Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.offNamed(AppRoutes.SIGNIN);
                          },
                          child: const Text("Quay về đăng nhập", style: TextStyle(fontWeight: FontWeight.w500,color: Color(0xff008053)))
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }

}