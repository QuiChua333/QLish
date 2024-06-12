import 'package:comment_tree/comment_tree.dart';
import 'package:comment_tree/widgets/comment_child_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/presentation/view/learning_sentence/main/learning_sentence_controller.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary/widget/Topic.dart';

import '../../../../data/models/sentenceTopic.dart';
import '../../learning_sentence_round/main/learning_sentence_round_controller.dart';

class CardTopicSentence extends StatelessWidget  {
  CardTopicSentence({
    Key? key,
    required this.sentenceTopicModel,
    this.index
  }) ;

  final SentenceTopicModel sentenceTopicModel;
  final int? index;

  final controller = Get.find<LearningSentenceController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LearningSentenceController>(
        builder: (_) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(17.2),
                      topRight: Radius.circular(17.2),
                      bottomRight: Radius.circular(17.2),
                      bottomLeft: Radius.circular(1.43),
                    )
                ),
                child: InkWell(
                  onTap: () {

                    controller.getStatusRounds(this.sentenceTopicModel.id,this.index);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: (){


                          },
                          child: index != controller.indexActive ?
                          Icon(FontAwesomeIcons.chevronRight,size: 18, color: Color(0xffDDDDDD),)  :
                          Icon(FontAwesomeIcons.chevronDown,size: 18, color: Color(0xffDDDDDD),)
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 8,),
                            Image.network('${sentenceTopicModel.image}', width: 30, height: 30, fit: BoxFit.cover,),
                            const SizedBox(width: 12,),
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${sentenceTopicModel.sentenceTopic}",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,color: Color(0xff342C27)),),
                                Text("${sentenceTopicModel.sentences!.length} mẫu câu",style: TextStyle( color: Color(0xff4D4D4F)),),
                              ],
                            )
                          ],
                        ),
                      ),
                      if (index == controller.indexActive) CircularPercentIndicator(
                        radius: 22,
                        lineWidth: 4,
                        percent: sentenceTopicModel.getNumRoundFinish()  / (sentenceTopicModel.listRounds != null ? sentenceTopicModel.listRounds!.length  : 1) ,
                        center:  Text(
                          "${sentenceTopicModel.getNumRoundFinish()}/${sentenceTopicModel.listRounds?.length ?? 0}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainColor,
                              fontSize: 14),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: AppColors.mainColor,
                        backgroundColor: const Color(0xffDDDDDD),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8,),
              if (index == controller.indexActive)   Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(17.2),
                      topRight: Radius.circular(1.43),
                      bottomRight: Radius.circular(17.2),
                      bottomLeft: Radius.circular(17.2),
                    )
                ),
                child: CommentTreeWidget<String, Map<String, dynamic>>(


                  "",
                  sentenceTopicModel.listRounds ?? [],
                  treeThemeData:
                  TreeThemeData(lineColor: Color(0xffDDDDDD)!, lineWidth: 3),
                  avatarRoot: (context, data) => const PreferredSize(
                    child: SizedBox(height: 0,),
                    preferredSize: Size.fromRadius(18),
                  ),
                  avatarChild: (context, data) =>  PreferredSize(
                    child: CircleAvatar(
                      radius: 8,
                       backgroundColor: (data['round'] - 1 > controller.lastIndexFinish + 1) ? Colors.grey : AppColors.mainColor,
                    ),
                    preferredSize: Size.fromRadius(10),
                  ),
                  contentChild: (context, data) {
                    return  InkWell(
                      onTap: () {
                        if (data['round'] - 1 > controller.lastIndexFinish + 1) return;
                        Get.toNamed(AppRoutes.LEARNING_SENTENCE_ROUND, arguments:{
                          "roundStatus": data,
                          "roundSentence": sentenceTopicModel.sentences[data['round']-1]
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Mẫu ${data['round']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                              SizedBox(height: 4,),
                              Row(
                                children: [
                                  Text("Bài học"),
                                ],
                              ),
                              SizedBox(height: 4,),
                              Row(
                                children: [
                                  Text("Trạng thái: "),
                                  Text("${data['status']}",style: TextStyle(color: Color(0xffF3AE29))),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: (){},
                                icon: FaIcon(FontAwesomeIcons.ellipsisVertical),
                              ),
                              SizedBox(height: 12,),
                              SvgPicture.asset('assets/images/talk.svg', width: 20,),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  contentRoot: (context, data) {
                    return Text("");
                  },
                ),
              ),

            ],
          );
        }
    );
  }
}