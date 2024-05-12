import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
typedef StringFunction = String? Function(String? value);
class InputPassword extends StatelessWidget {
  InputPassword({
    Key? key,
    this.hint,
    required this.controller,
    this.borderRadius,
    this.paddingV,
    this.validator
  }) : super(key: key);
  String? hint;
  TextEditingController controller;
  double? borderRadius;
  double? paddingV;
  StringFunction? validator;

  @override
  Widget build(BuildContext context) {
    var hide = true.obs;
    return Obx(() => TextFormField(
      controller: controller,
      obscureText: hide.value,
      cursorColor: AppColors.mainColor,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
              borderSide: BorderSide(color: Color(0xff1A1C3D), width: 1)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            borderSide: BorderSide(color: AppColors.mainColor, width: 1),
          ),
          contentPadding:
          EdgeInsets.only(left: 20, right: 24, top: paddingV ?? 16, bottom: paddingV ?? 16),
          hintText: hint ?? "Nhập mật khẩu",
          hintStyle: TextStyle(fontSize: 14, color: Color(0xffB9BBC0)),
          suffixIcon: IconButton(
              onPressed: () {
                hide.value = !hide.value;
              },
              splashColor: Colors.transparent,
              icon: Icon(
                hide.value ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                size: 20,
              )

          )),
      validator: validator,
    ));
  }
}
