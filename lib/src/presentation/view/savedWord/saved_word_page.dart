import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/data/models/sentenceTopic.dart';
import 'package:qlish/src/data/models/wordTopicWithLearntCount%20.dart';
import 'package:qlish/src/data/models/wordTopicWithSavedCount%20.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/view/dictionary/main/dictionary_controller.dart';
import 'package:qlish/src/presentation/view/learning_sentence/main/learning_sentence_controller.dart';
import 'package:qlish/src/presentation/view/learning_sentence/widget/sentence_topic_vocabulary.dart';
import 'package:qlish/src/presentation/view/learntWord/learnt_word_controller.dart';
import 'package:qlish/src/presentation/view/learntWord/widget/CardTopicLearned.dart';
import 'package:qlish/src/presentation/view/savedWord/saved_word_controller.dart';
import 'package:qlish/src/presentation/view/savedWord/widget/CardTopicSaved.dart';

import '../../../data/models/wordTopic.dart';


class SavedWordPage extends StatelessWidget {
  SavedWordPage({Key? key}) : super(key: key);
  final controller = Get.put(SavedWordController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SavedWordController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
              title: const Text("TỪ ĐÃ LƯU"),
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: controller.isLoading ? Center(child: CircularProgressIndicator(
              color: AppColors.mainColor,
              backgroundColor: AppColors.mainBackground,
            ),) : Container(
                padding: EdgeInsets.all(24),
                child: ListView.builder(
                    itemCount: controller.wordTopicWithSavedCounts.length,
                    itemBuilder: (context,index) {
                      WordTopicWithSavedCount item =controller.wordTopicWithSavedCounts[index];


                      return GestureDetector(
                        onTap: ()  {
                          controller.setIndexActive(index);
                          Get.toNamed(AppRoutes.SAVED_WORD_DETAIL_PAGE);
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: CardTopicSaved(item:item)),
                      );
                    })
            ),
        ),
      );
    });
  }
}