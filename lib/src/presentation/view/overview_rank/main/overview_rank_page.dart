import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qlish/src/presentation/view/overview_rank/widget/item_rank.dart';


class OverviewRankPage extends StatelessWidget {
  OverviewRankPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cá nhân', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                Icon(Icons.settings)
              ],
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: Get.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 26, // Image radius
                              backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2023/11/20/23/06/woman-8402052_1280.jpg'),
                            ),
                            const SizedBox(width: 14,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Huỳnh Ngọc Quí', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 240,
                                  ),
                                    child: const Text('Có mặt 1 ngày liên tục (Tổng 7 ngày)')
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 14,),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.5, color: const Color(0xffDDDDDD)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.solidStar,
                                    size: 14,
                                    color: Color(0xffFFDA1A),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "100",
                                    style: TextStyle(
                                         fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.5, color: Color(0xffDDDDDD)),
                                  borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.fire,
                                    size: 14,
                                    color: Color(0xffEC6264),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "100",
                                    style: TextStyle(
                                       fontSize: 14  ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.5, color: Color(0xffDDDDDD)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/medal.png', width: 20,),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    "Vàng",
                                    style: TextStyle(
                                       fontSize: 14  ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         const Padding(
                           padding: EdgeInsets.symmetric(horizontal: 16),
                           child: Text('Bảng vàng', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                         ),
                        const SizedBox(height: 20,),
                        ItemRank(),
                        ItemRank(myAccount: true),
                        ItemRank(),
                        ItemRank(),
                        ItemRank(),
                        SizedBox(height: 28,),
                        InkWell(
                          onTap: () { print('qqq'); },
                            child: Center(child: Text('Xem tất cả', style: TextStyle(fontSize: 16, color: Color(0xff342C27), fontWeight: FontWeight.w300))))

                      ],
                    ),
                  ),

                ],
              ),
            ),
          )
      ),
    );
  }
}