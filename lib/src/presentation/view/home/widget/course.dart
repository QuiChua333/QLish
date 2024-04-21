

import 'package:flutter/material.dart';

Widget Course({name ="", description="", assetImage="", backgroundColor, bottomSideColor}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: backgroundColor ?? Colors.white,
      border:  Border(
        bottom: BorderSide(
          width: 6,
          color: bottomSideColor ?? Colors.white
        )
      )
    ),
    padding: const EdgeInsets.only(top: 24, left: 24, bottom: 24, right: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(assetImage, width: 44, height: 44, fit: BoxFit.cover,),
        SizedBox(height: 12,),
         Text(name ?? "", style: TextStyle(color: Colors.white),),
         Text(description ?? "", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),)
      ],
    ),
  );
}