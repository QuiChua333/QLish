import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../data/models/user.dart';

class  ItemRank extends StatelessWidget {
  ItemRank({
    Key? key,
    required this.user,
    required this.myAccount,
    required this.stt,

  }) ;
  final UserModel user;
  final bool myAccount;
  final int stt;
  @override
  Widget build(BuildContext context) {
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
                   Text('${stt}', style: TextStyle(fontWeight: FontWeight.w600),),
                  const SizedBox(width: 12,),
                   CircleAvatar(
                    radius: 20, // Image radius
                    backgroundImage: NetworkImage('${user.avatar}'),
                  ),
                  const SizedBox(width: 12,),
                  Expanded(child: Text('${user.name}', style: TextStyle(fontWeight: myAccount == true ? FontWeight.w600 : null),)),
                  const Icon(
                    FontAwesomeIcons.solidStar,
                    size: 14,
                    color: Color(0xffFFDA1A),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    "${user.score}",
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
}