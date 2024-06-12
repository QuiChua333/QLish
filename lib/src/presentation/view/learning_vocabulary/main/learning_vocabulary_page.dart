import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/data/models/wordTopic.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary/main/learning_vocabulary_controller.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary/widget/card_topic_vocabulary.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary_round/main/learning_vocabulary_round_controller.dart';

class LearningVocabularyPage extends StatelessWidget {
  LearningVocabularyPage({Key? key}) : super(key: key);

  final controller = Get.put(LearningVocabularyController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LearningVocabularyController>(
        builder: (_) {
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  surfaceTintColor: Colors.transparent,
                  centerTitle: true,
                  title: const Text("HỌC TỪ VỰNG"),
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                body: !controller.isLoading ? Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  width: Get.width,
                  child:  Column(
                    children: [
                      Container(
                        color: AppColors.mainColor,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        child: Row(

                          children: [
                            Image.asset('assets/images/badge.png'),
                            SizedBox(width: 20,),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("TIẾP TỤC CÁC BÀI HỌC CỦA BẠN", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
                                Text("Đừng bỏ cuộc giữa chừng bạn nhé!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
                              ],
                            ),

                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16,horizontal: 24),
                            child: ListView.builder(
                              itemCount: controller.allWordTopics.length,
                              itemBuilder: (context, index) {
                                WordTopicModel item = controller.allWordTopics[index];
                                return Padding(
                                    padding: EdgeInsets.only(top: 12),
                                    child: CardTopicVocabulary(wordTopicModel: item, index: index,)
                                );
                              },
                            )
                        ),
                      )
                    ],
                  ),
                ) : Center(child: CircularProgressIndicator(
                  color: AppColors.mainColor,
                  backgroundColor: AppColors.mainBackground,
                ),)
            ),
          );
        }
    );
  }
}