import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qlish/src/data/models/user.dart';

class ItemTopRank extends StatelessWidget {
  ItemTopRank({
    Key? key,
    required this.user,
    required this.top,
  }) ;
  final UserModel user;
  final int top;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Medal(top,user),
        const SizedBox(height: 16,),
        Container(
            constraints: const BoxConstraints(
                maxWidth: 120
            ),
            child: Text('$top. ${user.name}',textAlign: TextAlign.center ,style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 13),)
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
              "${user.score}",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white),
            )
          ],
        ),
      ],
    );
  }
}


Widget Medal(top,user) {
  return Container(
    child: Stack(
      children: [
         Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: CircleAvatar(
            radius: 32, // Image radius
            backgroundImage: NetworkImage('${user.avatar}'),
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