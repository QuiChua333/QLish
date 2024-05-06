import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/component/button/button.dart';

Widget ResultComponent() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: [
      Expanded(child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 1,
                color: Color(0xffDDDDDD),
              ),
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff1CBC02)
                ),
              ),
            ],
          ),
          SizedBox(width: 16,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Câu 1', style: TextStyle( fontWeight: FontWeight.w500),),
              SizedBox(height: 2,),
              Text('Câu hỏi: water (n)?', ),
              SizedBox(height: 2,),
              Row(
                children: [
                  Text('Câu trả lời: ', ),
                  Text('lion', style: TextStyle(color: Color(0xffF3AE29)), ),
                ],
              )
            ],
          ),
        ],
      ),),
      Align(
        alignment: Alignment.bottomLeft,
        child: CustomButton(onTap: () {}, text: 'nước',
          width: 20, textSize: 15,
          backgroundColor: AppColors.mainColor,
          height: 20,
          textColor: Colors.white,
          textWeight: FontWeight.w300,
        ),
      ),
      SizedBox(width: 16,)
    ],
  );
}