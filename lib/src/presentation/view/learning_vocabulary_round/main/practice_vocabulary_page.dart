import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary_round/main/learning_vocabulary_controller.dart';


class PracticeVocabularyPage extends StatelessWidget {
  PracticeVocabularyPage({Key? key}) : super(key: key);
  LearningVocabularyController controller = Get.find<LearningVocabularyController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LearningVocabularyController>(
        builder: (_) {
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  surfaceTintColor: Colors.transparent,
                  centerTitle: true,
                  title: const Text("THE ZOO - VÒNG 1"),
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
                      padding: const EdgeInsets.only(bottom: 16, top: 16),
                      width: Get.width,
                      height: Get.height,
                      child:  Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Stack(
                              children: [
                                Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffE9E8E8),
                                  ),
                                ),
                                Stack(
                                    children: [
                                      AnimatedContainer(
                                        height: 10,
                                        duration: Duration(milliseconds: 300), //
                                        width: (Get.width-40)*controller.sttQuestion/10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Color(0xffF0CD51),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10,
                                        right: 10,
                                        top: 2,
                                        child: Container(
                                          height: 4,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Color(0xffFFEEC1),
                                          ),
                                        ),
                                      )
                                    ]
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Expanded(
                            child: Container(
                              width: Get.width,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)
                                  )
                              ),
                              child:  Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Question x/y', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                                    ],
                                  ),
                                  SizedBox(height: 50,),
                                  Text('water (n)', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),),
                                  SizedBox(height: 50,),
                                  Divider(color: Color(0xffDDDDDD)),
                                  SizedBox(height: 50,),
                                  InkWell(
                                    onTap: (){
                                      controller.setIndexAnswer(1);
                                    },
                                    child: Container(
                                      width: Get.width,
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Text('nước', style: TextStyle(fontSize: 20, color: controller.indexAnswer == 1 ? Color(0xff29ABEA) : Color(0xff606061)),textAlign: TextAlign.center,),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: controller.indexAnswer == 1 ? Color(0xffD3EEFB) : Colors.transparent,
                                          border: Border(
                                            top: BorderSide(width: 1, color: controller.indexAnswer == 1 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                            left: BorderSide(width: 1, color: controller.indexAnswer == 1 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                            right: BorderSide(width: 1, color: controller.indexAnswer == 1 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                            bottom: BorderSide(width: 3, color: controller.indexAnswer == 1 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  InkWell(
                                    onTap: (){
                                      controller.setIndexAnswer(2);
                                    },
                                    child: Container(
                                      width: Get.width,
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Text('nước', style: TextStyle(fontSize: 20, color: controller.indexAnswer == 2 ? Color(0xff29ABEA) : Color(0xff606061)),textAlign: TextAlign.center,),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: controller.indexAnswer == 2 ? Color(0xffD3EEFB) : Colors.transparent,
                                          border: Border(
                                            top: BorderSide(width: 1, color: controller.indexAnswer == 2 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                            left: BorderSide(width: 1, color: controller.indexAnswer == 2 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                            right: BorderSide(width: 1, color: controller.indexAnswer == 2 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                            bottom: BorderSide(width: 3, color: controller.indexAnswer == 2 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  InkWell(
                                    onTap: (){
                                      controller.setIndexAnswer(3);
                                    },
                                    child: Container(

                                      width: Get.width,
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Text('nước', style: TextStyle(fontSize: 20, color: controller.indexAnswer == 3 ? Color(0xff29ABEA) : Color(0xff606061)),textAlign: TextAlign.center,),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: controller.indexAnswer == 3 ? Color(0xffD3EEFB) : Colors.transparent,
                                          border: Border(
                                            top: BorderSide(width: 1, color: controller.indexAnswer == 3 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                            left: BorderSide(width: 1, color: controller.indexAnswer == 3 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                            right: BorderSide(width: 1, color: controller.indexAnswer == 3 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                            bottom: BorderSide(width: 3, color: controller.indexAnswer == 3 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  InkWell(
                                    onTap: (){
                                      controller.setIndexAnswer(4);
                                    },
                                    child: Container(
                                      width: Get.width,
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Text('nước', style: TextStyle(fontSize: 20, color: controller.indexAnswer == 4 ? Color(0xff29ABEA) : Color(0xff606061)),textAlign: TextAlign.center,),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: controller.indexAnswer == 4 ? Color(0xffD3EEFB) : Colors.transparent,
                                          border: Border(
                                            top: BorderSide(width: 1, color: controller.indexAnswer == 4 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                            left: BorderSide(width: 1, color: controller.indexAnswer == 4 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                            right: BorderSide(width: 1, color: controller.indexAnswer == 4 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                            bottom: BorderSide(width: 3, color: controller.indexAnswer == 4 ? Color(0xff04BFD9) : Color(0xffCCCCCC)),
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: InkWell(
                          onTap: (){
                            controller.nextQuestion();
                          },
                          child: Container(
                            width: Get.width,
                            height: 65,
                            color: AppColors.mainColor,
                            alignment: Alignment.center,
                            child: Text('TIẾP TỤC', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white),),
                          ),
                        )
                    )
                  ],
                )),
          );
        }
    );
  }
}


