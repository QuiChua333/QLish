import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/component/input/normal_input.dart';

class EmailVerifyPage extends StatelessWidget {
  EmailVerifyPage({Key? key}) : super(key: key);
  TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Get.height*0,),
                  const Text('Q', style: TextStyle(fontSize:70,color: Color(0xffFFBA1A), fontFamily: 'Rowdies', fontWeight: FontWeight.w700),),
                  const Text('LISH', style: TextStyle(fontSize: 70,color: Color(0xffFFBA1A), fontFamily: 'Rowdies', fontWeight: FontWeight.w700, height: 1),),
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
                                  child: Text('Nhập mã xác thực', style: TextStyle(),)
                              ),
                            ),
                            NormalInput(
                              controller: codeController, hint: "Code", borderRadius: 24, paddingV: 10,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: (){},
                                child: const Text('Gửi lại', style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xffFFBA1A),
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFBA1A)
                                ),)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Get.height*0.08),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 24),
                          child: CustomButton(
                            onTap: () {

                            },
                            text: 'Xác nhận',
                            textColor: const Color(0xffF3AE29),
                            textWeight: FontWeight.w700,
                            borderRadius: 40,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

}