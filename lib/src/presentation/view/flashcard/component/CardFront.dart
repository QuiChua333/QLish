import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


class CardFront extends StatelessWidget{

  CardFront({this.wordName = 'word name', this.audio = ''});

  String wordName;
  String audio;


  FlutterTts flutterTts = FlutterTts();

  Future _speak(String text) async{
    var result = await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                color: Color(0x1f000000),
                blurRadius: 12,
                offset: Offset(0, 4)
            )
          ]
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 26, left: 23),
            child: InkWell(
              onTap: () {
                _speak(wordName);
              },
              child: const Icon(
                Icons.volume_up,
                color: Colors.black45,
                size: 32.0,
              ),
            ),
          ),
          Align(alignment: Alignment.center,child: Text(wordName, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff252526)),)),
        ],
      ),
    );
  }

}