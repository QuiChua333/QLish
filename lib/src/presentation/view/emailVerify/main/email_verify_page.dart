import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/component/input/normal_input.dart';
import 'package:qlish/src/presentation/view/emailVerify/main/email_verify_controller.dart';

class EmailVerifyPage extends StatelessWidget {
  EmailVerifyPage({Key? key}) : super(key: key);
  TextEditingController codeController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    Get.put(EmailVerifyController());
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
                    margin: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        const Column(
                          children: [
                            Icon(Icons.mail_outline_rounded, size: 60, color: Color(0xff444444),),
                            SizedBox(height: 20,),
                            Text("Vui lòng xác minh email của bạn", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
                            SizedBox(height: 24,),
                            Text("Một liên kết xác minh email đã gửi đến email của bạn. Vui lòng kiểm tra và truy cập liên kết để xác minh email!", textAlign: TextAlign.center,),
                            SizedBox(height: 16,),
                            Text("Nếu ứng dụng không chuyển trang sau khi xác minh, bấm vào nút tiếp tục bên dưới",textAlign: TextAlign.center,)
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 24),
                                child: CustomButton(
                                  onTap: () {

                                  },
                                  text: 'Tiếp tục',
                                  textColor: const Color(0xffF3AE29),
                                  textWeight: FontWeight.w700,
                                  borderRadius: 40,
                                ),
                              ),
                            ],
                          ),
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

                ],
              ),
            ),
          )
      ),
    );
  }

}