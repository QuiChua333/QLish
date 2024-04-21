import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/presentation/view/ipa/widget/ipa_component.dart';

class IPAPage extends StatelessWidget {
  IPAPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            centerTitle: true,
            title: const Text("BẢNG IPA"),
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
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 40,),
                        Text(
                          "Cùng học phát âm",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Tiếng Anh nào!",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          "Tập nghe và phát âm các âm trong",
                          style: TextStyle(
                              fontSize: 14,),
                        ),
                        Text(
                          "tiếng anh",
                          style: TextStyle(
                              fontSize: 14,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32,),
                  Divider(
                    height: 2,
                    color: Color(0xffC9C7C7),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nguyên âm", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                        // point
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: Expanded(
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                childAspectRatio: (1 / 0.7),
                              ),
                              itemCount: 8,
                              itemBuilder: (context,index) {
                                return IPAComponent();
                              },
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 32,),
                  const Divider(
                    height: 2,
                    color: Color(0xffC9C7C7),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Phụ âm", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                        // point
                        Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: Expanded(
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                  childAspectRatio: (1 / 0.7),
                                ),
                                itemCount: 8,
                                itemBuilder: (context,index) {
                                  return IPAComponent();
                                },
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}


