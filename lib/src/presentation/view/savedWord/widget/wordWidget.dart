





import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qlish/src/presentation/view/learntWord/learnt_word_controller.dart';
import 'package:qlish/src/presentation/view/savedWord/saved_word_controller.dart';

class WordWidget extends StatelessWidget {
  WordWidget({super.key,
    required this.wordName,
    required this.wordMean,
    required this.phonetic,
    required this.image,
    required this.wordType,
    required this.onTap,
    required this.saved,
    required this.onTapStar,
    this.showSave = true,
  });
  final String wordName;
  final String wordMean;
  final String phonetic;
  final String image;
  final String wordType;
  final bool saved;
  final VoidCallback onTapStar;
  final VoidCallback onTap;
  final bool showSave;
  final controller = Get.find<SavedWordController>();


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x1f000000),
                  blurRadius: 10,
                  offset: Offset(0, 0.5)
              )
            ]),
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  flex: 4,
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(image, width: 67, height: 67, fit: BoxFit.cover,)
                      ),
                      const SizedBox(width: 10,),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("$wordName ", overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xff252526)),),
                                Expanded(child: Text("($wordType)", overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Color(0xff252526)),))
                              ],
                            ),
                            Text(phonetic, style: const TextStyle(fontSize: 12),),
                            const SizedBox(height: 2,),
                            Row(
                              children: [
                                Expanded(
                                    child: SizedBox(child: Text(wordMean, overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 12),))),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {

                          controller.speak(wordName);

                        },
                        child: const Icon(
                          Icons.volume_up,
                          color: Colors.black45,
                          size: 24.0,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      if (showSave) InkWell(
                        onTap: () {
                          onTapStar();
                        },
                        child: Icon(
                          saved ? Icons.star : Icons.star_outline,
                          color: saved ? Colors.orange : Colors.black45,
                          size: 24.0,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}