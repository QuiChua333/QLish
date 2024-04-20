import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';

class NormalInput extends StatelessWidget {
  NormalInput(
      {Key? key,
      this.hint,
      required this.controller,
      this.borderRadius,
      this.paddingV})
      : super(key: key);
  String? hint;
  TextEditingController controller;
  double? borderRadius;
  double? paddingV;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: TextFormField(
      controller: controller,
      cursorColor: AppColors.mainColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            borderSide: BorderSide(color: Color(0xff1A1C3D), width: 1)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          borderSide: BorderSide(color: AppColors.mainColor, width: 1),
        ),
        contentPadding: EdgeInsets.only(
            left: 20, right: 24, top: paddingV ?? 16, bottom: paddingV ?? 16),
        hintText: hint ?? "Nhập vào đây",
        hintStyle: TextStyle(fontSize: 14, color: Color(0xffB9BBC0)),
      ),
    ));
  }
}
