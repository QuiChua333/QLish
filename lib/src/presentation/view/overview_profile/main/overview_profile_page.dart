import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/core/utils/repository/user_repository/UserRepository.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/component/input/input_password.dart';
import 'package:qlish/src/presentation/component/input/normal_input.dart';
import 'package:qlish/src/presentation/view/edit_profile/widget/form_info.dart';
import 'package:qlish/src/presentation/view/home/main/home_controller.dart';

class OverviewProfilePage extends StatelessWidget {
  OverviewProfilePage({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cá nhân', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                IconButton(onPressed: () {
                  Get.toNamed(AppRoutes.EDIT_PROFILE);
                }, icon: Icon(Icons.settings))
              ],
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 26, // Image radius
                              backgroundImage: NetworkImage(controller.user.avatar),
                            ),
                            SizedBox(width: 14,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${controller.user.name}', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 240,
                                  ),
                                    child: Text('${controller.user.email}')
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 14,),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.5, color: Color(0xffDDDDDD)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.solidStar,
                                    size: 14,
                                    color: Color(0xffFFDA1A),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "${controller.user.score}",
                                    style: TextStyle(
                                        color: Color(0xffFEA832), fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 8,),

                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  SizedBox(height: 16,),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sổ tay lưu trữ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.SAVED_WORD_PAGE);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color: Color(0xffDDDDDD))
                            ),
                            child: Row(
                              children: [
                                Image.asset('assets/images/vocabularyBrochure.png', width: 26),
                                SizedBox(width: 24,),
                                Text('Sổ từ vựng'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color: Color(0xffDDDDDD))
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/images/sentenceBrochure.png', width: 26),
                              SizedBox(width: 24,),
                              Text('Sổ mẫu câu'),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Đã học', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.LEARNT_WORD_PAGE);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 1, color: Color(0xffDDDDDD))
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/images/vocabularyStt.png', width: 26),
                                      SizedBox(width: 28,),
                                      Column(
                                        children: [
                                          Text('Từ vựng', style: TextStyle(color: Color(0xff000000)),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 12,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(width: 1, color: Color(0xffDDDDDD))
                                ),
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/sentenceStt.png', width: 26),
                                    SizedBox(width: 28,),
                                    Column(
                                      children: [
                                        Text('Mẫu câu', style: TextStyle(color: Color(0xff000000)),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
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
  }
}