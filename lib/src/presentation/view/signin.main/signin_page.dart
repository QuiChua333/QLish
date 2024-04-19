import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/presentation/component/button/button.dart';

import 'signin_controller.dart';




class SignInPage extends StatelessWidget{
  SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SignInController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              width: Get.width,
              child: Column(
                children: [
                  SizedBox(height: Get.height*0.1,),
                  Text('Q', style: TextStyle(fontSize:70,color: Color(0xffFFBA1A), fontFamily: 'Rowdies', fontWeight: FontWeight.w700),),
                  Text('LISH', style: TextStyle(fontSize: 70,color: Color(0xffFFBA1A), fontFamily: 'Rowdies', fontWeight: FontWeight.w700, height: 1),),
                  Container(
                    margin: EdgeInsets.only(top: Get.height*0.15),
                    child: Column(
                      children: [
                        Text('qqqq'),
                        Text('qqqq'),
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
                        Container(
                          child: CustomButton(
                            onTap: () {

                            },
                            text: 'Đăng nhập',
                            textColor: Color(0xffF3AE29),
                            textWeight: FontWeight.w700,
                            borderRadius: 40,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
        );
      },
    );

  }


}