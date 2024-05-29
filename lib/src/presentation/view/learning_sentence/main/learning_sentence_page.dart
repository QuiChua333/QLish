import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/view/learning_sentence/widget/sentence_topic_vocabulary.dart';

class LearningSentencePage extends StatelessWidget {
  LearningSentencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            centerTitle: true,
            title: const Text("HỌC MẪU CÂU"),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.only(bottom: 16),
            width: Get.width,
            child:  Column(
              children: [
                Container(
                  color: AppColors.mainColor,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/badge.png'),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("TIẾP TỤC CÁC BÀI HỌC CỦA BẠN", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
                          Text("Đừng bỏ cuộc giữa chừng bạn nhé!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
                        ],
                      ),
                      CustomButton(
                        onTap: () {},
                        text: "Bắt đầu",
                        width: 40,
                        height: 18,
                        textSize: 14,
                        borderRadius: 8,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16,horizontal: 24),
                      child: ListView.builder(
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 12),
                              child: CardTopicSentence()
                          );
                        },
                      )
                  ),
                )
              ],
            ),
          )),
    );
  }
}