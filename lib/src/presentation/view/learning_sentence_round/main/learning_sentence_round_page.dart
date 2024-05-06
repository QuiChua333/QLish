import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/component/dialog/dialog.dart';
import 'package:qlish/src/presentation/view/ipa/widget/ipa_component.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary_round/widget/flash_card.dart';

class LearningSentenceRoundPage extends StatelessWidget {
  LearningSentenceRoundPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            centerTitle: true,
            title: const Text("THE ZOO - VÒNG 1"),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.red
                ),
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16, left: 28, right: 28),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                    ),

                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12),
                              ),
                              border: Border(
                                left: BorderSide(width: 1,color: Color(0xffDDDDDD)),
                                right: BorderSide(width: 1,color: Color(0xffDDDDDD)),
                                top: BorderSide(width: 1,color: Color(0xffDDDDDD)),
                              ),
                            color: Colors.white,
                          ),
                          width: Get.width,

                          padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 72),
                          child: Column(
                            children: [
                              SizedBox(height: 12,),
                              Text('Mẫu câu lần này',
                                style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xffFF4869), fontSize: 18),),
                              SizedBox(height: 8,),
                              Text('"Mọi việc thế nào rồi"',
                                style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xff342C27), fontSize: 20),),
                              SizedBox(height: 48,),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                InkWell(child: Image.asset('assets/images/volume.png')),
                                  SizedBox(width: 12,),
                                  Text('How’s it going?', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w500),),
                              ],),
                              SizedBox(height: 32,),
                              Text('Nhấn để nói', style: TextStyle( fontSize: 16),),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.mic,
                                    color: Color(0xff6A9FDD),
                                    size: 48,
                                  )),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(width: 60,),
                                  SizedBox(
                                    width: 120,
                                    child: TextField(
                                      enabled: false,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(left: 8),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffDDDDDD)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4,),
                                  Text("+ 2", style: TextStyle(color: Color(0xffFFDA1A),fontWeight: FontWeight.w500, fontSize: 20),),
                                  SizedBox(width: 4,),
                                  Icon(
                                    FontAwesomeIcons.solidStar,
                                    size: 16,
                                    color: Color(0xffFFDA1A),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            width: Get.width,
                            height: 65,
                            color: AppColors.mainColor,
                            alignment: Alignment.center,
                            child: Text('TIẾP TỤC', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white),),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 32,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.download,color: Color(0xffADADAD),)),
                  )
                ]
              )
            ],
          )
      )
    );
  }
}


