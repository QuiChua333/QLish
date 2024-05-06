import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/component/input/input_password.dart';
import 'package:qlish/src/presentation/component/input/normal_input.dart';
import 'package:qlish/src/presentation/view/edit_profile/widget/form_info.dart';

class OverviewProfilePage extends StatelessWidget {
  OverviewProfilePage({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cá nhân', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                Icon(Icons.settings)
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
                              backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2023/11/20/23/06/woman-8402052_1280.jpg'),
                            ),
                            SizedBox(width: 14,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Huỳnh Ngọc Quí', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 240,
                                  ),
                                    child: Text('Có mặt 1 ngày liên tục (Tổng 7 ngày)')
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
                                    "100",
                                    style: TextStyle(
                                        color: Color(0xffFEA832), fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 8,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.5, color: Color(0xffDDDDDD)),
                                  borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.fire,
                                    size: 14,
                                    color: Color(0xffEC6264),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "100",
                                    style: TextStyle(
                                        color: Color(0xffFEA832), fontSize: 14  ),
                                  )
                                ],
                              ),
                            )
                          ],
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
                        Text('Thành tích của tôi', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset('assets/images/medal.png', width: 40),
                                  SizedBox(height: 6,),
                                  Text('Vàng')
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset('assets/images/winlose.png', width: 40),
                                  SizedBox(height: 6,),
                                  Text('Win: 1 - Lose: 2')
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset('assets/images/streak.png', width: 40),
                                  SizedBox(height: 6,),
                                  Text('365')
                                ],
                              )
                            ],
                          ),
                        ),

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
                        Text('Sổ tay lưu trữ', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                        SizedBox(height: 20,),
                        Container(
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
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
                                        Text('150', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Color(0xff6D6969)),),
                                        Text('Từ vựng', style: TextStyle(color: Color(0xff000000)),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 20,),
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
                                        Text('50', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Color(0xff6D6969)),),
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