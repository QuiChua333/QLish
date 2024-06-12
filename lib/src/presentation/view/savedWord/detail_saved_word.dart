
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qlish/src/presentation/view/savedWord/saved_word_controller.dart';
import 'package:qlish/src/presentation/view/savedWord/widget/wordWidget.dart';




class SavedWordDetailPage extends StatelessWidget {
  SavedWordDetailPage({super.key});
  final controller = Get.find<SavedWordController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SavedWordController>(
      builder: (controller) {
        return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  'TỪ ĐÃ LƯU',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff000000).withOpacity(0.2),
                        offset: Offset(0, 0),
                        blurRadius: 4,
                      )
                    ]),
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              controller.topicImage,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.only(left: 16, right: 30),
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    controller.topicName,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff252526)),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '${controller.count} từ',
                                    style: TextStyle(color: Color(0xff4D4D4F)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: Get.width,
                        height: 1,
                        color: Colors.black,
                        margin: EdgeInsets.symmetric(vertical: 16),
                      ),
                      TextField(

                        onChanged: (string) {
                          controller.handleChange(string);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.green,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xffF3AE29),
                                width: 1,
                              ),
                            ),
                            hintText: 'Enter word',
                            contentPadding: const EdgeInsets.all(12),
                            hintStyle:
                            const TextStyle(color: Color(0xff7D7D7E), fontSize: 14),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search),
                            )),
                      ),
                      SizedBox(height: 16,),
                      Expanded(
                          child: ListView.builder(
                              itemCount: controller.listWordsSavedByTopic.length,
                              itemBuilder: (context, index) {
                                var item = controller.listWordsSavedByTopic[index];
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 4),
                                  child: WordWidget(
                                    onTap: (){
                                    },
                                    wordName: item.name.toString(),
                                    wordMean: item.mean.toString(),
                                    phonetic: item.phonetic.toString(),
                                    image: item.image.toString(),
                                    wordType: item.wordType.toString(),
                                    saved: false,
                                    showSave: false,
                                    onTapStar: () {  }
                                    ,

                                  ),
                                );
                              })),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
