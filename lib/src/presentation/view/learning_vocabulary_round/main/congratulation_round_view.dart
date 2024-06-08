
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary_round/main/learning_vocabulary_round_controller.dart';

class CongratulationView extends StatelessWidget {
   CongratulationView({super.key});
   final controller = Get.find<LearningVocabularyRoundController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title:  Text(
            "${controller.wordTopicName} - Vòng ${controller.roundStatus['round']}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

        ),
        body: Container(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              Text('Congratulation!', style: TextStyle(color: Color(0xff007398), fontWeight: FontWeight.w700, fontSize: 28),),
              SizedBox(height: 8,),
              Text('Bạn vừa hoàn thành vòng ${controller.roundStatus['round']}', style: TextStyle(fontSize: 16, color: Color(0xff429EBB)),),
              SizedBox(height: 80,),
              Image.asset('assets/images/congratulation.png'),
              SizedBox(height: 32,),
              CircularPercentIndicator(
                radius: 36,
                lineWidth: 6,
                animation: false,
                percent: controller.roundStatus['round']  / controller.numberOfRounds,
                center:  Text(
                  '${controller.roundStatus['round']}/${controller.numberOfRounds}',
                  style:  TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: AppColors.mainColor
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: AppColors.mainColor,
              ),
              SizedBox(height: 18,),
              SizedBox(
                width: Get.width*0.6,
                  child: Text('Giờ cùng kiểm tra để ôn tập kiến thức vừa rồi!', style: TextStyle(fontSize: 18, color: Color(0xff429EBB)), textAlign: TextAlign.center,)),
              SizedBox(height: 32,),
              InkWell(
                onTap: () {
                  Get.offAndToNamed(AppRoutes.PRACTICE_VOCABULARY, arguments: {
                  "roundStatus" :controller.roundStatus,
                  "wordTopicName" :controller.wordTopicName,
                  "roundVocabulary" : controller.roundVocabulary,
                  });
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xff5CDDFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text('Tiếp tục', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18),),
                  ),
                ),
              )
            ],
          ),
        )
    );
    }

}