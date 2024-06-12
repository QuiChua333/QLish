import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/component/button/button.dart';

class CustomDialog extends StatelessWidget {
   CustomDialog({super.key,
     required this.onTap,
     this.title,
     this.content,
     this.contentOk,
   });

   VoidCallback onTap;
   String? title;
   String? content;
   String? contentOk;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Stack(
          children: [
            Container(
              width: Get.width*0.8,
              padding: EdgeInsets.only(top: 60, bottom: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${title}', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                  SizedBox(height: 20,),
                  Text('${content}', textAlign: TextAlign.center,),
                  SizedBox(height: 30,),
                  SizedBox(
                    width: 150,
                    child: CustomButton(
                        onTap: onTap,
                        text: '${contentOk}',
                        backgroundColor: AppColors.mainColor,
                        textColor: Colors.white,
                        borderRadius: 8,
                        height: 45,
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
    );
  }

}