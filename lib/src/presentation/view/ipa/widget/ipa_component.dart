import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget IPAComponent() {
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("a"),
        const Text("hot", style: TextStyle(color: Color(0xffABA9A9), fontWeight: FontWeight.w400),),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(child: Image.asset('assets/images/volume.png')),
        )
      ],
    )
  );
}