import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget ItemRank({ bool myAccount = false}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    decoration:  BoxDecoration(
        border: myAccount == true ? const Border(
          top: BorderSide(width: 1, color: Color(0xffFFB6E6)),
          bottom: BorderSide(width: 1, color: Color(0xffFFB6E6)),
        ) : null,
        color: myAccount == true ? Color(0xffFFE4F6) : null
    ),
    child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1, color: Color(0xffECECEC))
            )
        ),
        child:  Column(
          children: [
            Row(
              children: [
                const Text('27', style: TextStyle(fontWeight: FontWeight.w600),),
                const SizedBox(width: 12,),
                const CircleAvatar(
                  radius: 20, // Image radius
                  backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2023/11/20/23/06/woman-8402052_1280.jpg'),
                ),
                const SizedBox(width: 12,),
                Expanded(child: Text('Huỳnh Ngọc Quí', style: TextStyle(fontWeight: myAccount == true ? FontWeight.w600 : null),)),
                const Icon(
                  FontAwesomeIcons.solidStar,
                  size: 14,
                  color: Color(0xffFFDA1A),
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  "100",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: myAccount == true ? FontWeight.w600 : null),
                )
              ],
            ),
          ],
        )
    ),
  );
}