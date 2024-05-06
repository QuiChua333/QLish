import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/component/button/button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});
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
                  Text('PHẦN LUYỆN TẬP', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                  SizedBox(height: 20,),
                  Text('Hãy đạt điểm số từ 8 trở lên để qua vòng bạn nhé!', textAlign: TextAlign.center,),
                  SizedBox(height: 30,),
                  SizedBox(
                    width: 150,
                    child: CustomButton(
                        onTap: (){},
                        text: 'Bắt đầu',
                        backgroundColor: AppColors.mainColor,
                        textColor: Colors.white,
                        borderRadius: 8,
                        height: 45,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: 2,
                right: 2,
                child: IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: Icon(FontAwesomeIcons.xmark))
            )
          ],
        ),
    );
  }

}