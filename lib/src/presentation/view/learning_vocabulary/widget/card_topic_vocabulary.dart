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
import 'package:qlish/src/presentation/view/learning_vocabulary/widget/Topic.dart';

class CardTopicVocabulary extends StatelessWidget  {
  CardTopicVocabulary({
    Key? key,
    RxBool? showDetail
  }) : showDetail = showDetail ?? false.obs, super(key: key) ;

  RxBool showDetail;


  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Column(
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: (){
                      showDetail.value = !showDetail.value;
                      print(showDetail);
                    },
                    child: showDetail.value == false ?
                    Icon(FontAwesomeIcons.chevronRight,size: 18, color: Color(0xffDDDDDD),)  :
                    Icon(FontAwesomeIcons.chevronDown,size: 18, color: Color(0xffDDDDDD),)
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 8,),
                      Image.asset('assets/images/zoo.png', width: 30, height: 30, fit: BoxFit.cover,),
                      const SizedBox(width: 12,),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("The Zoo",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,color: Color(0xff342C27)),),
                          Text("25 vocabulary words",style: TextStyle( color: Color(0xff4D4D4F)),),
                        ],
                      )
                    ],
                  ),
                ),
                CircularPercentIndicator(
                  radius: 22,
                  lineWidth: 4,
                  percent: 0.4,
                  center:  Text(
                    "0/7",
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
          SizedBox(height: 8,),
          if (showDetail.value == true)  Container(
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
            child: CommentTreeWidget<String, String>(
              // Topic(
              //     name: "Ngocqui"),
              // [
              //   Topic(
              //       name: "Ngocqui"),
              //   Topic(
              //       name: "Ngocqui"),
              //   Topic(
              //       name: "Ngocqui"),
              //   Topic(
              //       name: "Ngocqui"),
              //   Topic(
              //       name: "Ngocqui"),
              //
              // ],

              "",
      [
        "22222",
        "33333"
      ],
              treeThemeData:
              TreeThemeData(lineColor: Color(0xffDDDDDD)!, lineWidth: 3),
              avatarRoot: (context, data) => const PreferredSize(
                child: SizedBox(height: 0,),
                preferredSize: Size.fromRadius(18),
              ),
              avatarChild: (context, data) => const PreferredSize(
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.grey,
                ),
                preferredSize: Size.fromRadius(10),
              ),
              contentChild: (context, data) {
                return  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Vòng 1", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                        SizedBox(height: 4,),
                        Row(
                          children: [
                            Text("Bài học: "),
                            Text("Chưa hoàn thành", style: TextStyle(color: Color(0xffF3AE29)),),
                          ],
                        ),
                        SizedBox(height: 4,),
                        Row(
                          children: [
                            Text("Luyện tập: "),
                            Text("Chưa hoàn thành",style: TextStyle(color: Color(0xffF3AE29))),
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
                );
              },
              contentRoot: (context, data) {
                return Text("");
              },
            ),
          ),

        ],
      ),
    );
  }
}