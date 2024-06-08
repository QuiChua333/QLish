import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/data/models/word.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary_round/main/learning_vocabulary_round_controller.dart';

class FlashCard extends StatelessWidget  {
  final WordModel word;
  FlashCard({super.key, required this.word });
  final controller = Get.find<LearningVocabularyRoundController>();
  @override
  Widget build(BuildContext context) {

    return GetBuilder<LearningVocabularyRoundController>(builder: (_) {
      if (word.name == controller.wordSpoken) {
        controller.setSpellTrue(word.id);
      }
      return Container(
        width: Get.width*0.7,
        padding: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 30),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.mainColor,width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    controller.speak(word.name);

                  },
                    child: Image.asset('assets/images/volume.png')),
                IconButton(onPressed: (){

                }, icon: Icon(Icons.download,color: Color(0xffADADAD),))
              ],
            ),
            Center(
              child: Image.network('${word.image}',width: 170, fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
            Text('${word?.name} (n)', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),),
            SizedBox(height: 4,),
            Text('${word?.phonetic}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
            SizedBox(height: 10,),
            Text('${word?.mean}', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),),
            SizedBox(height: 16,),
            Text('Nhấn để nói', style: TextStyle( fontSize: 16),),
            IconButton(
                onPressed: () {
                  controller.speechToText.isListening ? controller.stopListening() : controller.startListening();
                },
                icon: const Icon(
                  Icons.mic,
                  color: Color(0xff6A9FDD),
                  size: 48,
                )),
             Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 60,),
                Container(
                  width: 120,
                  padding: EdgeInsets.only(bottom: 4),
                  child: Center(child: Text('${controller.wordSpoken}', style: TextStyle(fontSize: 18),)),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color(0xffcccccc)
                      )
                    )
                  ),
                ),
                SizedBox(width: 4,),
                if (controller.listIdSpell.contains(word.id)) Row(children: [
                  Text("+ 2", style: TextStyle(color: Color(0xffFFDA1A),fontWeight: FontWeight.w500, fontSize: 20),),
                  SizedBox(width: 4,),
                  Icon(
                    FontAwesomeIcons.solidStar,
                    size: 16,
                    color: Color(0xffFFDA1A),
                  ),
                ],)
              ],
            ),
            SizedBox(height: 8,),
            Text('${controller.speechToText.isListening ? "listening..." : controller.speedEnable ? "Nhấn để nói" : "Mic không có sẵn"}'),

          ],
        ),
      );
    });
  }

}