import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:qlish/src/core/utils/constants/app_colors.dart';
import 'package:qlish/src/core/utils/constants/app_routes.dart';
import 'package:qlish/src/data/models/word.dart';
import 'package:qlish/src/presentation/component/dialog/dialog.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary_round/main/learning_vocabulary_round_controller.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary_round/widget/flash_card.dart';

class LearningVocabularyRoundPage extends StatefulWidget {
  LearningVocabularyRoundPage({super.key});
  final controller = Get.put(LearningVocabularyRoundController());
  @override
  StudyVocabularyRoundState createState() => StudyVocabularyRoundState();
}

class StudyVocabularyRoundState extends State<LearningVocabularyRoundPage> with TickerProviderStateMixin {



  List<Map<String,dynamic>> qqq = [
  {
  "name": "toilet",
  "mean": "bồn cầu",
  "phonetic": "/ˈtɔɪ.lət/",
  "wordType": "n",
  "wordTopicId": "0vGgR7QLVisr6XctyKVs",
  "isSpeed": false,
  "image": ""
  },
  {
  "name": "bathtub",
  "mean": "bồn tắm",
  "phonetic": "/ˈbæθ.tʌb/",
  "wordType": "n",
  "wordTopicId": "0vGgR7QLVisr6XctyKVs",
  "isSpeed": false,
  "image": ""
  },
  {
  "name": "towel",
  "mean": "khăn",
  "phonetic": "/ˈtaʊəl/",
  "wordType": "n",
  "wordTopicId": "0vGgR7QLVisr6XctyKVs",
  "isSpeed": false,
  "image": ""
  },
  ];
  List<WordModel> allWord =  [WordModel(name: "toilet1", mean: "toilet", phonetic: "toilet", wordType: "toilet", wordTopicId: "toilet"),
    WordModel(name: "toilet2", mean: "toilet", phonetic: "toilet", wordType: "toilet", wordTopicId: "toilet"),
    WordModel(name: "toilet3", mean: "toilet", phonetic: "toilet", wordType: "toilet", wordTopicId: "toilet")];
  List<WordModel> wordList = [WordModel(name: "toilet1", mean: "toilet", phonetic: "toilet", wordType: "toilet", wordTopicId: "toilet"),WordModel(name: "toilet2", mean: "toilet", phonetic: "toilet", wordType: "toilet", wordTopicId: "toilet"),WordModel(name: "toilet3", mean: "toilet", phonetic: "toilet", wordType: "toilet", wordTopicId: "toilet")];


  Queue<WordModel> wordQueue = Queue();
  Queue<WordModel> laterQueue = Queue();
  Queue<WordModel> rememberQueue = Queue();

  Queue<WordModel> historyList = Queue();
  late double _leftValue;
  late double _topValue;
  late double _leftValue2;
  late double _topValue2;
  late double cardWidth;
  late double cardHeight;
  late double windowWidth;

  // variable animation
  int _timePanAttachCard = 150;
  double valueToSlide = 200;
  double _opacityAttachCard = 0;
  late bool isCardLeft = true;
  late AnimationController _animationController;
  late AnimationController _animationController2;
  double opacityCard = 1;
  bool showContinue = false;


  @override
  void initState() {
    super.initState();
    wordQueue.addAll(wordList);
    initPositionCard();

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    Tween(end: 1.0, begin: 0.0).animate(_animationController).addListener(() {
      setState(() {

      });
    });

    _animationController2 = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    Tween(end: 1.0, begin: 0.0).animate(_animationController2).addListener(() {
      setState(() {

      });
    });
  }

  void initPositionCard(){
    final mediaQuery = (context.getElementForInheritedWidgetOfExactType<MediaQuery>()!.widget as MediaQuery).data;
    final physicalSize = mediaQuery.size;
    _leftValue = 60;
    _topValue = 90;
    _leftValue2 = 60;
    _topValue2 = 90;
    windowWidth = physicalSize.width;
    cardWidth = (physicalSize.width - _leftValue * 2); // tru cho phan padding hai ben
    cardHeight = (physicalSize.height - _topValue - 280); // tru title , bottom controller
  }

  void setDefaultState(int index){
    if(index == 1){
      _leftValue = 60;
      _topValue = 90;
      _opacityAttachCard = 0;
    }
    else{
      _leftValue2 = 60;
      _topValue2 = 90;
      _opacityAttachCard = 0;
    }
  }

  double convertChangedOpacity(double changePanUpdated){
    return changePanUpdated / (windowWidth / 5 + changePanUpdated);
  }

  void redoCard(){
    if(historyList.isEmpty){
      return;
    }
    if(historyList.removeLast() == 1){
      wordQueue.addFirst(rememberQueue.removeLast());
    }
    else{
      wordQueue.addFirst(laterQueue.removeLast());
    }
  }

  bool isCard1 = false;
  bool isFlipped = false;


  void initByStatusCard() {
    if(opacityCard == 0){
      isCard1 = true;
      if(_animationController.value < 0.5){
        isFlipped = false;
      }
      else{
        isFlipped = true;
      }
    }
    else{
      isCard1 = false;
      if(_animationController2.value < 0.5){
        isFlipped = false;
      }
      else{
        isFlipped = true;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          if (showContinue) Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: (){
                showDialog(context: context, builder: (context) => const CustomDialog());
              },
              child: Container(
                width: Get.width,
                height: 65,
                color: AppColors.mainColor,
                alignment: Alignment.center,
                child: Text('TIẾP TỤC', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white),),
              ),
            ),
          ),
          // So luong de sau, nho

          // Card
          Stack(
              children: [
                  AnimatedPositioned(
                    top: _topValue,
                    left: _leftValue,
                    duration: Duration(milliseconds: _timePanAttachCard),
                    child: AnimatedOpacity(
                      opacity: 1 - opacityCard,
                      duration: const Duration(milliseconds: 300),
                      child: GestureDetector(
                        onPanStart: (details) {
                          setState(() {

                            setDefaultState(2);

                          });
                        },
                        onPanUpdate: (details) {
                          setState(() {
                            _topValue += details.delta.dy;
                            _leftValue += details.delta.dx;
                            isCardLeft = _leftValue < 60;
                            _opacityAttachCard = convertChangedOpacity(_leftValue.abs());
                          });
                        },
                        onPanEnd: (details) {
                          setState(() {
                            if((_leftValue - 60).abs() > valueToSlide){
                              if(wordQueue.length == 1){
                                if(isCardLeft){
                                  laterQueue.add(wordQueue.first);
                                  showContinue = true;
                                  Get.offAndToNamed(AppRoutes.CONGRATULATION_VOCABULARY_ROUND);
                                }
                                else{

                                  wordQueue.addFirst(laterQueue.removeLast());
                                  _leftValue = isCardLeft ? 60 - windowWidth : windowWidth;
                                  _opacityAttachCard = 0;
                                  opacityCard = 1;
                                }


                                return;
                              }
                              if(isCardLeft){

                                laterQueue.add(wordQueue.removeFirst());

                              }
                              else{

                                if(laterQueue.isEmpty){
                                  _leftValue2 = isCardLeft ? 60 - windowWidth : windowWidth;
                                  setDefaultState(1);
                                  return;
                                }
                                wordQueue.addFirst(laterQueue.removeLast());

                              }
                              _leftValue = isCardLeft ? 60 - windowWidth : windowWidth;
                              _opacityAttachCard = 0;
                              opacityCard = 1;
                            }
                            else{
                              _leftValue2 = isCardLeft ? 60 - windowWidth : windowWidth;
                              setDefaultState(1);
                            }
                          });
                        },
                        child: Stack(
                          children: [
                            AnimatedOpacity(
                                opacity: 1 - _opacityAttachCard,
                                duration:  Duration(milliseconds: 10 ),
                                child: Transform(
                                  alignment: FractionalOffset.center,
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001)
                                    ..rotateY(pi * _animationController.value),
                                  child: GestureDetector(
                                      onTap: () {
                                        print('doo');
                                        // _animationController.forward();
                                      },
                                      child:
                                      Center(child: FlashCard(name:wordQueue.first.name))
                                           ),
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    top: _topValue2,
                    left: _leftValue2,
                    duration: Duration(milliseconds: _timePanAttachCard),
                    child: AnimatedOpacity(
                      opacity: opacityCard,
                      duration: const Duration(milliseconds: 300),
                      child: GestureDetector(
                        onPanStart: (details) {
                          setState(() {

                            setDefaultState(1);

                          });
                        },
                        onPanUpdate: (details) {
                          setState(() {
                            _topValue2 += details.delta.dy;
                            _leftValue2 += details.delta.dx;
                            isCardLeft = _leftValue2 < 60;
                            _opacityAttachCard = convertChangedOpacity(_leftValue2.abs());
                          });
                        },
                        onPanEnd: (details) {
                          setState(() {
                            if((_leftValue2 - 60).abs() > valueToSlide){
                              if(wordQueue.length == 1){
                                if(isCardLeft){
                                  laterQueue.add(wordQueue.first);
                                  showContinue = true;
                                  Get.offAndToNamed(AppRoutes.CONGRATULATION_VOCABULARY_ROUND);
                                }
                                else{

                                  wordQueue.addFirst(laterQueue.removeLast());
                                  _leftValue2 = isCardLeft ? 60 - windowWidth : windowWidth;
                                  _opacityAttachCard = 0;
                                  opacityCard = 0;
                                }


                                return;
                              }
                              if(isCardLeft){

                                laterQueue.add(wordQueue.removeFirst());

                              }
                              else{

                                if(laterQueue.isEmpty){
                                  _leftValue = isCardLeft ? 60 - windowWidth : windowWidth;
                                  setDefaultState(2);
                                  return;
                                }
                                wordQueue.addFirst(laterQueue.removeLast());

                              }
                              _leftValue2 = isCardLeft ? 60 - windowWidth : windowWidth;
                              _opacityAttachCard = 0;
                              opacityCard = 0;
                            }
                            else{
                              _leftValue = isCardLeft ? 60 - windowWidth : windowWidth;
                              setDefaultState(2);
                            }
                          });
                        },
                        child: Stack(
                          children: [

                            AnimatedOpacity(
                                opacity: 1 - _opacityAttachCard,
                                duration: const Duration(milliseconds: 10),
                                child: Transform(
                                  alignment: FractionalOffset.center,
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001)
                                    ..rotateY(pi * _animationController2.value),
                                  child: GestureDetector(
                                      onTap: () {
                                        // _animationController2.forward();
                                      },
                                      child:
                                      Center(child: FlashCard(name: wordQueue.first.name,))

                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
          ),
          // Progress
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.only(top: 20),
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
                        width: Get.width*(laterQueue.length )/wordList.length,
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
        ],
      ),
    );
  }


}



