import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/component/button/button.dart';

Widget ResultComponent({result, index}) {

  return Column(
    children: [
      Row(
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
                        color:  result['answer'] == result['correctAnswer'] ? Color(0xff1CBC02) :Color(0xFFE21515)
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Câu ${index + 1}', style: TextStyle( fontWeight: FontWeight.w500),),
                  SizedBox(height: 2,),
                  if (result['isImage']) Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Câu hỏi: ', ),
                      Image.network(result['questionImage'], width: 60, height: 60, fit: BoxFit.contain),
                      Text('  ?', ),
                    ],
                  )
                  else Text('Câu hỏi: water (n)?', ),

                  SizedBox(height: 2,),
                  Row(
                    children: [
                      Text('Câu trả lời: ', ),
                      Text('${result['answer']}', style: TextStyle(color: Color(0xffF3AE29)), ),
                    ],
                  )
                ],
              ),
            ],
          ),),

          SizedBox(width: 16,)
        ],
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: CustomButton(onTap: () {}, text: '${result['correctAnswer']}',
          width: 20, textSize: 15,
          backgroundColor: AppColors.mainColor,
          height: 20,
          textColor: Colors.white,
          textWeight: FontWeight.w300,
        ),
      ),
    ],
  );
}