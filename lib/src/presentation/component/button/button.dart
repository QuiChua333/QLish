import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.onTap,
    this.backgroundColor,
    this.borderRadius,
    this.textColor,
    required this.text,
    this.width,
    this.height,
    this.textWeight,
  }) : super(key: key);
  VoidCallback onTap;
  Color? backgroundColor;
  double? borderRadius;
  Color? textColor;
  String text;
  double? width;
  double? height;
  FontWeight? textWeight;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
            foregroundColor: Colors.white.withOpacity(0.2),
            minimumSize: Size(width ?? Get.width, height ?? Get.height * 0.06),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 0)),
            backgroundColor: backgroundColor ?? Colors.white),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor ?? AppColors.textColor,
                fontSize: 16,
                fontWeight: textWeight ?? FontWeight.w400),
          ),
        ));
  }
// @override
// Widget build(BuildContext context) {
//   return Container(
//     decoration: BoxDecoration(
//       color: backgroundColor ?? Colors.white,
//       borderRadius: BorderRadius.circular(borderRadius ?? 0),
//     ),
//     child: Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: onTap,
//         child: Container(
//           padding:  EdgeInsets.symmetric(horizontal: paddingH ?? 20, vertical: paddingV ?? 16),
//           child: Center(
//             child: Text(
//               text,
//               style: TextStyle(
//                 color: textColor ?? AppColors.textColor,
//                 fontSize: 16,
//                 fontWeight: textWeight ?? FontWeight.w400
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
}
