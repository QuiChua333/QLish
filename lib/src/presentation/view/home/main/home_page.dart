import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/view/home/widget/course.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeController>(() => HomeController());
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Container(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.solidStar,
                            size: 20,
                            color: Color(0xffFFDA1A),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "100",
                            style: TextStyle(
                                color: Color(0xffFEA832), fontSize: 18),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.fire,
                            size: 20,
                            color: Color(0xffEC6264),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "100",
                            style: TextStyle(
                                color: Color(0xffFEA832), fontSize: 18),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {}, icon: FaIcon(FontAwesomeIcons.bell)),
                ],
              ),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    Container(
                        width: Get.width,
                        padding: EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/card_home.png'),
                                fit: BoxFit.fill)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 36,
                                  lineWidth: 6,
                                  animation: true,
                                  percent: 0.4,
                                  center: const Text(
                                    "75%",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff3FB8D2),
                                        fontSize: 16),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: const Color(0xff3FB8D2),
                                  backgroundColor: const Color(0xffD0EFFF),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 16),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Từ vựng",
                                        style:
                                            TextStyle(color: Color(0xffBCB4B5)),
                                      ),
                                      Text("Vòng 3: Động vật",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Tiếp tục hành trình của bạn thôi nào!",
                                        style: TextStyle(
                                            color: Color(0xffBCB4B5),
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 160,
                                height: 45,
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 28),
                                child: CustomButton(
                                  onTap: () {},
                                  text: "Học tiếp",
                                  borderRadius: 20,
                                  textWeight: FontWeight.w600,
                                  textColor: Colors.white,
                                  backgroundColor: const Color(0xff3FB8D2),
                                ),
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border:
                              Border.all(width: 1, color: Color(0xffDDDDDD)),
                          color: Colors.white),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                color: Color(0xff6A9FDD),
                              )),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration.collapsed(
                                hintText: 'Tra từ điển',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Color(0xffB9BBC0)),
                                border: InputBorder.none,
                              ),
                              cursorColor: Color(0xff6A9FDD),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.mic,
                                color: Color(0xff6A9FDD),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Get.height * 0.05),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Course(
                                assetImage: 'assets/images/dictionary.png',
                                name: "Học từ vựng",
                                    description: "1000 từ vựng",
                                    backgroundColor: Color(0xffFF96BC),
                                    bottomSideColor: Color(0xffDF87A7),
                              )),
                              SizedBox(
                                width: 24,
                              ),
                              Expanded(
                                  child: Course(
                                    assetImage: 'assets/images/ipa.png',
                                    name: "Phiên âm IPA",
                                    description: "1000 từ vựng",
                                    backgroundColor: Color(0xff73AEF3),
                                    bottomSideColor: Color(0xff6A9FDD)
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Course(
                                      assetImage: 'assets/images/communication.png',
                                      name: "Học câu giao tiếp",
                                      description: "1000 từ vựng",
                                      backgroundColor: Color(0xffF0CD51),
                                      bottomSideColor: Color(0xffDEBD4A)
                                  )),
                              SizedBox(
                                width: 24,
                              ),
                              Expanded(
                                  child: Course(
                                      assetImage: 'assets/images/vocabulary_game.png',
                                      name: "Game từ vựng",
                                      description: "1000 từ vựng",
                                      backgroundColor: Color(0xffF4B295),
                                      bottomSideColor: Color(0xffDAA791)
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}

// Stack(
// children: [
// Container(
// height: 170,
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(1.43),
// topRight: Radius.circular(17.2),
// bottomLeft: Radius.circular(17.2),
// bottomRight: Radius.circular(1.43) ),
// image: DecorationImage(
// image: AssetImage('assets/images/card_home.png'),
// fit: BoxFit.cover
// ),
// ),
// ),
// Container(
// height: 150,
// padding: EdgeInsets.all(24),
// child: Column(
// children: [
// Row(
// children: [
//
// ],
// )
// ],
// ),
// )
// ],
// ),
