import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary_round/widget/result_component.dart';

class ResultVocabularyPage extends StatelessWidget {
  ResultVocabularyPage({Key? key}) : super(key: key);

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
          body: Stack(
            children: [
              Container(
                width: Get.width,
                padding: EdgeInsets.only(top: 24, left: 32, right: 32),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12), topRight: Radius.circular(12))),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Kết quả của bạn là: 6/10',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff007398)),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Image.asset('assets/images/icon_sad.png', height: 70),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      'Hãy luyện tập lại vòng này bạn nhé',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Text(
                      'Tổng kết',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xff007398)),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 80),
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                            border: Border(
                              top: BorderSide(width: 1, color: Color(0xffDDDDDD)),
                              left: BorderSide(width: 1, color: Color(0xffDDDDDD)),
                              right: BorderSide(width: 1, color: Color(0xffDDDDDD)),
                            )
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                child: ResultComponent(),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                child: ResultComponent(),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                child: ResultComponent(),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                child: ResultComponent(),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16),
                                child: ResultComponent(),
                              ),
                                                
                                                
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                      width: Get.width,
                      height: 65,
                      color: AppColors.mainColor,
                      alignment: Alignment.center,
                      child: Text('LÀM LẠI', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white),),
                    ),
                  )
              )
            ],
          )
        ));
  }
}
