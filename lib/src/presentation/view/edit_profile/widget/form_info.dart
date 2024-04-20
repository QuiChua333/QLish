import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';

Widget FormInfo({isChange = false, onTap, label ="", content ="" }) {
  return  Column(
    children: [
      Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(label)
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0xff1A1C3D)),
          borderRadius: BorderRadius.circular(40)
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(content),
            ),
            if (isChange) InkWell(
              onTap: onTap,
              child: Text("Thay đổi", style: TextStyle(color: AppColors.mainColor, fontWeight: FontWeight.w500),),
            )
          ],
        ),
      )
    ],
  );
}