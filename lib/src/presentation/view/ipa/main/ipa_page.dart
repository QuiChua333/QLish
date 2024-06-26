import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/data/models/ipa.dart';
import 'package:qlish/src/presentation/view/ipa/main/ipa_controller.dart';
import 'package:qlish/src/presentation/view/ipa/widget/ipa_component.dart';

class IPAPage extends StatelessWidget {
  IPAPage({Key? key}) : super(key: key);

  final controller = Get.put(IPAController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<IPAController>(builder: (_) {
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
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(bottom: 16),
                width: Get.width,
                child:  Column(
                  children: [
                    const Center(
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
                          SizedBox(height: 16,),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: (1 / 1.5),
                            ),
                            itemCount: controller.ipans.length,
                            itemBuilder: (context,index) {
                              IPAModel ipa = controller.ipans[index];
                              return IPAComponent(ipa: ipa,);
                            },
                          ),
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
                          SizedBox(height: 16,),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                                childAspectRatio: (1 / 1.5)
                            ),
                            itemCount: controller.ipaps.length,
                            itemBuilder: (context,index) {
                              IPAModel ipa = controller.ipaps[index];
                              return IPAComponent(ipa: ipa,);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );
    });
  }
}


