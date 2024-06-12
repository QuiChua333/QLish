import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/data/models/sentenceTopic.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/view/dictionary/main/dictionary_controller.dart';
import 'package:qlish/src/presentation/view/learning_sentence/main/learning_sentence_controller.dart';
import 'package:qlish/src/presentation/view/learning_sentence/widget/sentence_topic_vocabulary.dart';

import '../../../component/input/normal_input.dart';

class DictionaryPage extends StatelessWidget {
  DictionaryPage({Key? key}) : super(key: key);
  final controller = Get.put(DictionaryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DictionaryController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
              title: const Text("TRA TỪ ĐIỂN"),
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: Container(
              padding: const EdgeInsets.only(bottom: 16, left: 20, right: 20),
              width: Get.width,
              child:  Column(
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border:
                        Border.all(width: 1, color: Color(0xffDDDDDD)),
                        color: Colors.white),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (controller.searchController.text.trim() == '') return;
                              controller.search();
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Color(0xff6A9FDD),
                            )),
                         Expanded(
                          child: TextFormField(
                            controller: controller.searchController,
                            cursorColor: AppColors.mainColor,
                            onChanged: (text) {
                              controller.handleSearch(text);
                            },
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(color: AppColors.mainColor, width: 0),
                              ),
                              contentPadding: EdgeInsets.only(
                                  left: 20, right: 24, top:  16, bottom:  16),
                              hintText:  "Tra từu điển anh - việt",
                              hintStyle: TextStyle(fontSize: 14, color: Color(0xffB9BBC0)),
                            ),

                          ),
                        ),
                        if (controller.isShowDelete)
                          IconButton(
                              onPressed: () {
                                controller.searchController.text = '';
                                controller.update();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Color(0xff6A9FDD),
                              ))
                      ],
                    ),
                  ),
                 if (controller.isHasResult)  Container(
                   padding: EdgeInsets.all(20),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8),
                       color: Colors.white
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('${controller.name}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                       SizedBox(height: 8,),
                       Row(
                         children: [
                           InkWell(
                               onTap: () {
                                      controller.audioPhonetic();

                               },
                               child: Image.asset('assets/images/volume.png', width: 50,)),
                           SizedBox(width: 6,),
                           Text('Phiên âm: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xffAAAAAA))),
                           SizedBox(width: 6,),
                           Text('${controller.phonetic}'),
                         ],
                       ),
                       SizedBox(height: 12,),
                       Row(
                         children: [
                           Text('Từ loại: ',style: TextStyle(fontSize: 16,)),
                           SizedBox(width: 6,),
                           Text('${controller.wordType}', style: TextStyle(fontSize: 16,)),
                         ],
                       ),
                       SizedBox(height: 6,),
                       Row(
                         children: [
                           Text('Nghĩa: ', style: TextStyle(fontSize: 16,)),
                           SizedBox(width: 6,),
                           Text('${controller.mean}', style: TextStyle(fontSize: 16,)),
                         ],
                       )

                     ],
                   ),
                 )
                ],
              ),
            )),
      );
    });
  }
}