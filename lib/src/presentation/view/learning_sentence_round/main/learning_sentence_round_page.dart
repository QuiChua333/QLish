import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/presentation/component/dialog/dialog.dart';
import 'package:qlish/src/presentation/view/ipa/widget/ipa_component.dart';
import 'package:qlish/src/presentation/view/learning_sentence_round/main/learning_sentence_round_controller.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary_round/widget/flash_card.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../learning_vocabulary_round/main/learning_vocabulary_round_controller.dart';

class LearningSentenceRoundPage extends StatelessWidget {
  LearningSentenceRoundPage({Key? key}) : super(key: key);
  final controller = Get.put(LearningSentenceRoundController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LearningSentenceRoundController>(builder: (_) {
      if (controller.roundSentence.sentence.toLowerCase() ==
          controller.sentenceSpoken) {
        controller.setSpellTrue(controller.roundSentence.id);
      }
      return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                surfaceTintColor: Colors.transparent,
                centerTitle: true,
                title: Text("Mẫu ${controller.roundStatus['round']}"),
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    YoutubePlayer(
                      controller: controller.youtubeController,
                      showVideoProgressIndicator: true,
                      bottomActions: [
                        CurrentPosition(),
                        ProgressBar(
                          isExpanded: true,
                          colors: const ProgressBarColors(
                              playedColor: Colors.amber,
                              handleColor: Colors.amberAccent),
                        ),
                        const PlaybackSpeedButton(),
                      ],
                    ),
                    Stack(children: [
                      Container(
                        margin: EdgeInsets.only(top: 16, left: 28, right: 28),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  topLeft: Radius.circular(12),
                                ),
                                border: Border(
                                  left: BorderSide(
                                      width: 1, color: Color(0xffDDDDDD)),
                                  right: BorderSide(
                                      width: 1, color: Color(0xffDDDDDD)),
                                  top: BorderSide(
                                      width: 1, color: Color(0xffDDDDDD)),
                                ),
                                color: Colors.white,
                              ),
                              width: Get.width,
                              padding: EdgeInsets.only(
                                  top: 16, left: 16, right: 16, bottom: 72),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'Mẫu câu lần này',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffFF4869),
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '${controller.roundSentence.mean}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff342C27),
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 48,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                controller.speak(controller
                                                    .roundSentence.sentence);
                                              },
                                              child: Image.asset(
                                                  'assets/images/volume.png')),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        '${controller.roundSentence.sentence}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  Text(
                                    'Nhấn để nói',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        controller.speechToText.isListening
                                            ? controller.stopListening()
                                            : controller.startListening();
                                      },
                                      icon: const Icon(
                                        Icons.mic,
                                        color: Color(0xff6A9FDD),
                                        size: 48,
                                      )),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 60,
                                      ),
                                      Container(
                                        width: 200,
                                        padding: EdgeInsets.only(bottom: 4),
                                        child: Center(
                                            child: Text(
                                          '${controller.sentenceSpoken}',
                                          style: TextStyle(fontSize: 18),
                                        )),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 1,
                                                    color: Color(0xffcccccc)))),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                      '${controller.speechToText.isListening ? "listening..." : controller.speedEnable ? "Mic sẵn sàng" : "Mic không có sẵn"}'),
                                  if (controller.listIdSpell
                                      .contains(controller.roundSentence.id))
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "+ 2",
                                          style: TextStyle(
                                              color: Color(0xffFFDA1A),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.solidStar,
                                          size: 16,
                                          color: Color(0xffFFDA1A),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.saveLearntSentence(controller.roundSentence.id);
                                Get.back();
                              },
                              child: Container(
                                width: Get.width,
                                height: 65,
                                color: AppColors.mainColor,
                                alignment: Alignment.center,
                                child: Text(
                                  'TIẾP TỤC',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      if (!controller.listIdSave
                          .contains(controller.roundSentence.id))
                        Positioned(
                            top: 20,
                            right: 32,
                            child: IconButton(
                                onPressed: () {
                                  controller
                                      .saveSentence(controller.roundSentence.id);
                                  ToastMessage.show(
                                      'Đã  lưu câu', ToastMessage.SUCCESS);
                                },
                                icon: Icon(
                                  Icons.download,
                                  color: Color(0xffADADAD),
                                )))
                      else
                        Positioned(
                            top: 20,
                            right: 32,
                            child: IconButton(
                                onPressed: () {
                                  controller
                                      .saveSentence(controller.roundSentence.id);
                                  ToastMessage.show(
                                      'Đã hủy lưu câu', ToastMessage.SUCCESS);
                                },
                                icon: Icon(
                                  Icons.download,
                                  color: AppColors.mainColor,
                                ))),
                      Positioned(
                        top: 20,
                        left: 32,
                        child: IconButton(
                            onPressed: () {
                              controller.replayVideo();
                            },
                            icon: Icon(
                              Icons.replay,
                              color: Color(0xffADADAD),
                            )),
                      )
                    ])
                  ],
                ),
              )));
    });
  }
}
