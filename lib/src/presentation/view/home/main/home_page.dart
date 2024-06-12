import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/core/utils/repository/authentication_repository/authentication_repository.dart';
import 'package:qlish/src/core/utils/repository/user_repository/UserRepository.dart';
import 'package:qlish/src/data/models/user.dart';
import 'package:qlish/src/presentation/component/button/button.dart';
import 'package:qlish/src/presentation/view/home/widget/course.dart';
import 'package:qlish/src/presentation/view/navigation_menu/dastboard.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(
      builder: (_) {
        controller.ref();
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Container(
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [

                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            controller.user.name,
                            style: TextStyle(
                                color: Color(0xffFEA832), fontSize: 18),
                          )
                        ],
                      ),
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
                            '${controller.user.score}',
                            style: TextStyle(
                                color: Color(0xffFEA832), fontSize: 18),
                          )
                        ],
                      )
                    ],
                  ),
                ),

              ),
              body: SingleChildScrollView(
                child: Container(
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
                                    percent: 1,
                                    center: const Text(
                                      '',
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
                                          "Ứng dụng học tiếng anh",
                                          style: TextStyle(
                                              color: Color(0xffBCB4B5)),
                                        ),
                                        Text("QLISH",
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
                                  margin: const EdgeInsets.only(
                                      top: 20, bottom: 28),
                                  child: CustomButton(
                                    onTap: ()  {

                                    },
                                    text: "Khám phá",
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
                        margin: EdgeInsets.only(top: Get.height * 0.05),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.LEARNING_VOCABULARY);
                                      },
                                      child: Course(
                                        assetImage: 'assets/images/dictionary.png',
                                        name: "Học từ vựng",
                                        description: 'Chủ đề',
                                        backgroundColor: Color(0xffFF96BC),
                                        bottomSideColor: Color(0xffDF87A7),
                                      ),
                                    )),
                                const SizedBox(
                                  width: 24,
                                ),
                                Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.IPA);
                                      },
                                      child: Course(
                                          assetImage: 'assets/images/ipa.png',
                                          name: "Phiên âm IPA",
                                          description: '44 âm',
                                          backgroundColor: Color(0xff73AEF3),
                                          bottomSideColor: Color(0xff6A9FDD)),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.LEARNING_SENTENCE);
                                      },
                                      child: Course(
                                          assetImage:
                                          'assets/images/communication.png',
                                          name: "Học câu giao tiếp",
                                          description: "Chủ đề",
                                          backgroundColor: Color(0xffF0CD51),
                                          bottomSideColor: Color(0xffDEBD4A)),
                                    )),
                                SizedBox(
                                  width: 24,
                                ),
                                Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.DICTIONARY);
                                      },
                                      child: Course(
                                          assetImage:
                                          'assets/images/vocabulary_game.png',
                                          name: "Tra từ điển",
                                          description: "Anh Việt",
                                          backgroundColor: Color(0xffF4B295),
                                          bottomSideColor: Color(0xffDAA791)),
                                    )),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ),
              )),
        );
      },
    );
  }
}


