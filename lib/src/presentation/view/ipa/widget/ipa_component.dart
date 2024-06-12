import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/data/models/ipa.dart';
import 'package:qlish/src/presentation/view/ipa/main/ipa_controller.dart';

class IPAComponent extends StatelessWidget {
  final controller = Get.find<IPAController>();
  IPAComponent({
    Key? key,
    required this.ipa,
  }) ;
  final IPAModel ipa;
  @override
  Widget build(BuildContext context) {
    return Container(

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: const Border(
              bottom: BorderSide(width: 3, color: Color(0xffCCCCCC)),
              top: BorderSide(width: 1, color: Color(0xffCCCCCC)),
              left: BorderSide(width: 1, color: Color(0xffCCCCCC)),
              right: BorderSide(width: 1, color: Color(0xffCCCCCC)),
            )
        ),
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 12),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
             Text("${ipa.ipa}"),
             SizedBox(height: 4,),
             Text("${ipa.exampleWord}", style: TextStyle(color: Color(0xffABA9A9), fontWeight: FontWeight.w400),),
            SizedBox(height: 8,),
            InkWell(
              onTap: () {
                controller.audioPhonetic(ipa.audio);
              },
              child: Row(
                children: [
                  Text('Nghe âm: ', style: TextStyle(fontSize: 12),),
                  InkWell(child: Image.asset('assets/images/volume.png')),
                ],
              ),
            ),
            SizedBox(height: 16,),
            InkWell(
              onTap: () {
                controller.speak(ipa.exampleWord);
              },
              child: Row(
                children: [
                  Text('Nghe từ: ', style: TextStyle(fontSize: 12)),
                  InkWell(child: Image.asset('assets/images/volume.png')),
                ],
              ),
            ),

          ],
        )
    );
  }

}