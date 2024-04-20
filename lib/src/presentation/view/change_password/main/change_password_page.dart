import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/component/input/input_password.dart';
import 'package:qlish/src/presentation/view/edit_profile/widget/form_info.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

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
                  Container(
                    margin: EdgeInsets.only(top: Get.height*0.03),
                    child: const Center(
                      child: Text(
                        "Đổi mật khẩu",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24
                        ),
                      ),
                    ),
                  ),
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
                                  child: Text('Mật khẩu hiện tại', style: TextStyle(),)
                              ),
                            ),
                            InputPassword(
                              controller: currentPasswordController, hint: "Nhập mật khẩu hiện tại", borderRadius: 24, paddingV: 10,
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
                                  child: Text('Mật khẩu mới', style: TextStyle(),)
                              ),
                            ),
                            InputPassword(
                              controller: newPasswordController, hint: "Nhập mật khẩu mới", borderRadius: 24, paddingV: 10,
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
                                  child: Text('Xác nhận mật khẩu mới', style: TextStyle(),)
                              ),
                            ),
                            InputPassword(
                              controller: confirmNewPasswordController, hint: "Nhập lại mật kẩu mới", borderRadius: 24, paddingV: 10,
                            ),
                          ],
                        ),
                        SizedBox(height: 16,),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: CustomButton(
                      text: "Hoàn thành",
                      backgroundColor: AppColors.mainColor,
                      textColor: Colors.white,
                      textWeight: FontWeight.w500,
                      borderRadius: 8,
                      onTap: () {
                        print("Đăng xuất nè");
                      },
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