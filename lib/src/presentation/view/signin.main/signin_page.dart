import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/component/input/input_password.dart';
import 'package:qlish/src/presentation/component/input/normal_input.dart';

import 'signin_controller.dart';




class SignInPage extends StatelessWidget{
  SignInPage({super.key});
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SignInController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Get.offNamed(AppRoutes.INTRO);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              width: Get.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: Get.height*0,),
                    Text('Q', style: TextStyle(fontSize:70,color: Color(0xffFFBA1A), fontFamily: 'Rowdies', fontWeight: FontWeight.w700),),
                    Text('LISH', style: TextStyle(fontSize: 70,color: Color(0xffFFBA1A), fontFamily: 'Rowdies', fontWeight: FontWeight.w700, height: 1),),
                    Container(
                      margin: EdgeInsets.only(top: Get.height*0.1),
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
                          SizedBox(height: 20,),
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
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Get.height*0.08),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 24),
                            child: CustomButton(
                              onTap: () {
                
                              },
                              text: 'Đăng nhập',
                              textColor: Color(0xffF3AE29),
                              textWeight: FontWeight.w700,
                              borderRadius: 40,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 24),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: Color(0xffE3E3E3),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child:  Text('Hoặc', style: TextStyle(color: Color(0xff6A707C)),),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: Color(0xffE3E3E3),
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){

                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  border: Border.all(width: 1, color: Color(0xffE3E3E3))
                              ),
                              child: Center(
                                  child: SvgPicture.asset('assets/images/google_ic.svg')
                              ),
                            ),
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