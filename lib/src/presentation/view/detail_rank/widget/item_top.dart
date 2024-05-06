import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget ItemTopRank({int? top}) {
  return Column(
    children: [
      Medal(top),
      const SizedBox(height: 16,),
      Container(
        constraints: const BoxConstraints(
          maxWidth: 120
        ),
          child: Text('$top. Huỳnh Ngọc Quí',textAlign: TextAlign.center ,style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 13),)
      ),
      const SizedBox(height: 8,),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            FontAwesomeIcons.solidStar,
            size: 16,
            color: Color(0xffFFDA1A),
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            "100",
            style: TextStyle(
                fontSize: 14,
            color: Colors.white),
          )
        ],
      ),
    ],
  );
}


Widget Medal(top) {
  return Container(
    child: Stack(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: CircleAvatar(
            radius: 32, // Image radius
            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2023/11/20/23/06/woman-8402052_1280.jpg'),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: top == 1 ? Image.asset('assets/images/top1Rank.png', width: 24,) :
            top == 2 ? Image.asset('assets/images/top2Rank.png', width: 24,) :
            Image.asset('assets/images/top3Rank.png', width: 24,),
          )
        )
      ],
    ),
  );
}