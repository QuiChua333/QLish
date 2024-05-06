import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/component/dialog/dialog.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary_round/widget/flash_card.dart';


class LearningVocabularyRoundPage extends StatelessWidget {
  LearningVocabularyRoundPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
                                Container(
                                  height: 10,
                                  width: Get.width*0.6,
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
                    Center(
                        child: FlashCard()
                    ),

                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: InkWell(
                    onTap: (){
                      showDialog(context: context, builder: (context) => const CustomDialog());
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
}


