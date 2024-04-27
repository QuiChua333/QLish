import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/view/ipa/widget/ipa_component.dart';

class LearningVocabularyRoundPage extends StatelessWidget {
  LearningVocabularyRoundPage({Key? key}) : super(key: key);


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
          body: Container(
            padding: const EdgeInsets.only(bottom: 16),
            width: Get.width,
            child:  SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      children: [
                        Container(
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffE9E8E8),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 10,
                              width: Get.width*0.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffF0CD51),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              right: 10,
                              top: 2,
                              child: Container(
                                height: 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffFFEEC1),
                                ),
                              ),
                            )
                          ]
                        ),
                        
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Container(
                      width: Get.width*0.7,

                      padding: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 30),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.mainColor,width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(child: Image.asset('assets/images/volume.png')),
                              IconButton(onPressed: (){}, icon: Icon(Icons.download,color: Color(0xffADADAD),))
                            ],
                          ),
                          Center(
                            child: Image.asset('assets/images/fish.png',width: 170, fit: BoxFit.cover,),
                          ),
                          SizedBox(height: 10,),
                          Text('fish (n)', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),),
                          SizedBox(height: 4,),
                          Text('/fif/', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
                          SizedBox(height: 10,),
                          Text('con cá', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),),
                          SizedBox(height: 16,),
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
                  )
                ],
              ),
            ),
          )),
    );
  }
}


