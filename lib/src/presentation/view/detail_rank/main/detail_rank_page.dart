import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qlish/src/presentation/view/detail_rank/widget/item_top.dart';
import 'package:qlish/src/presentation/view/overview_rank/widget/item_rank.dart';


class DetailRankPage extends StatelessWidget {
  DetailRankPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            width: Get.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffFC53FF),
                            Color(0xffC853FF)
                          ],
                          stops: [0.0,0.9],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bảng Xếp Hạng', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: ItemTopRank(top: 2),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: ItemTopRank(top: 1),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: ItemTopRank(top: 3),
                            )
                          ],)
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      ItemRank(),
                      ItemRank(myAccount: true),
                      ItemRank(),
                      ItemRank(),
                      ItemRank(),
                      ItemRank(),
                      ItemRank(),
                      ItemRank(),
                      ItemRank(),
                      ItemRank(),
                    ],
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}