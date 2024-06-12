import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/core/utils/repository/authentication_repository/authentication_repository.dart';
import 'package:qlish/src/core/utils/repository/user_repository/UserRepository.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/view/edit_profile/widget/form_info.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);
  final user = UserRepository.instance.currentUser;
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
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(width: 4,color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                              )
                            ],
                            shape: BoxShape.circle,
                            image:  DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage('${user.avatar}')
                            )
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                              color: AppColors.mainColor
                            ),
                            child: const Icon(Icons.edit, color: Colors.white, size: 20,),
                          )
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Get.height*0.03),
                    child: Column(
                      children: [
                        FormInfo(
                            label: "Tên", 
                            content: "${user.name}",
                            isChange: true, 
                            onTap: () {
                              Get.toNamed(AppRoutes.CHANGE_NAME);
                            }
                        ),
                        const SizedBox(height: 16,),
                        FormInfo(
                            label: "Mật khẩu",
                            content: "●●●●●●●●●●",
                            isChange: true,
                            onTap: () {
                              Get.toNamed(AppRoutes.CHANGE_PASSWORD);
                            }
                        ),
                        const SizedBox(height: 16,),
                        FormInfo(
                            label: "Email liên kết",
                            content: "${user.email}",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: CustomButton(
                      text: "Đăng xuất",
                      backgroundColor: AppColors.mainColor,
                      textColor: Colors.white,
                      textWeight: FontWeight.w500,
                      borderRadius: 8,
                      onTap: () async {
                        await AuthenticationRepository.instance
                            .logout();
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