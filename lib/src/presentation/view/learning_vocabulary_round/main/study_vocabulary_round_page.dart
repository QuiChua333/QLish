import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:qlish/src/data/models/word.dart';
import 'package:qlish/src/presentation/view/learning_vocabulary_round/widget/flash_card.dart';

class StudyVocabularyRoundPage extends StatefulWidget {
  StudyVocabularyRoundPage({super.key});

  @override
  StudyVocabularyRoundState createState() => StudyVocabularyRoundState();
}

class StudyVocabularyRoundState extends State<StudyVocabularyRoundPage> with TickerProviderStateMixin {

  // List<WordModel> allWord = Get.arguments['allWord'];
  // List<WordModel> wordList = Get.arguments['wordList'];

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
  List<WordModel> allWord =  [WordModel(name: "toilet", mean: "toilet", phonetic: "toilet", wordType: "toilet", wordTopicId: "toilet")];
  List<WordModel> wordList = [WordModel(name: "toilet", mean: "toilet", phonetic: "toilet", wordType: "toilet", wordTopicId: "toilet")];


  Queue<WordModel> wordQueue = Queue();
  Queue<WordModel> laterQueue = Queue();
  Queue<WordModel> rememberQueue = Queue();

  Queue<int> historyList = Queue();
  late double _leftValue;
  late double _topValue;
  late double _leftValue2;
  late double _topValue2;
  late double cardWidth;
  late double cardHeight;
  late double windowWidth;

  // variable animation
  int _timePanAttachCard = 150;
  double valueToSlide = 150;
  double _opacityAttachCard = 0;
  late bool isCardLeft = true;
  late AnimationController _animationController;
  late AnimationController _animationController2;
  double opacityCard = 1;


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
    _leftValue = 20;
    _topValue = 90;
    _leftValue2 = 20;
    _topValue2 = 90;
    windowWidth = physicalSize.width;
    cardWidth = (physicalSize.width - _leftValue * 2); // tru cho phan padding hai ben
    cardHeight = (physicalSize.height - _topValue - 200); // tru title , bottom controller
  }

  void setDefaultState(int index){
    if(index == 1){
      _leftValue = 20;
      _topValue = 90;
      _opacityAttachCard = 0;
    }
    else{
      _leftValue2 = 20;
      _topValue2 = 90;
      _opacityAttachCard = 0;
    }
  }

  double convertChangedOpacity(double changePanUpdated){
    return changePanUpdated / (windowWidth / 20 + changePanUpdated);
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
    print('init');
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
        centerTitle: true,
        title: Text("${laterQueue.length + rememberQueue.length + 1}/${wordList.length}", style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                      ..rotateY(pi),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          redoCard();
                        });
                      },
                      child: const Icon(
                        Icons.redo_outlined,
                        color: Colors.black87,
                        size: 32.0,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          // So luong de sau, nho
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  padding: const EdgeInsets.only(right: 15),
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFE8D4),
                    border: Border.all(color: const Color(0xffFF8838)),
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(90), bottomRight: Radius.circular(90)),
                  ),
                  duration: const Duration(milliseconds: 100),
                  child: Align(alignment: Alignment.centerRight,child:
                  // _leftValue - (width - 300) / 2 < 0 ?
                  // const Text("+1", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
                  Text("${laterQueue.length}", style: const TextStyle(color: Color(0xffFF8838), fontSize: 16, fontWeight: FontWeight.w500),)
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  padding: const EdgeInsets.only(left: 15),
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffD9FFF1),
                    border: Border.all(color: const Color(0xff1CD0AF)),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(90), bottomLeft: Radius.circular(90)),
                  ),
                  child: Align(alignment: Alignment.centerLeft, child:
                  // _leftValue - (width - 300) / 2 > 0 ?
                  // const Text("+1", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
                  Text("${rememberQueue.length}", style: const TextStyle(color: Color(0xff1CD0AF), fontSize: 16, fontWeight: FontWeight.w500),)
                  ),
                )
              ],
            ),
          ),
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

                            _animationController2.reverse();
                            setDefaultState(2);
                          });
                        },
                        onPanUpdate: (details) {
                          setState(() {
                            _topValue += details.delta.dy;
                            _leftValue += details.delta.dx;
                            isCardLeft = _leftValue < 20;
                            _opacityAttachCard = convertChangedOpacity(_leftValue.abs());
                          });
                        },
                        onPanEnd: (details) {
                          setState(() {
                            if((_leftValue - 20).abs() > valueToSlide){
                              if(wordQueue.length == 1){
                                if(isCardLeft){
                                  laterQueue.add(wordQueue.first);
                                }
                                else{
                                  rememberQueue.add(wordQueue.first);
                                }
                                // Get.offAndToNamed(AppRoutes.FLASH_CARD_RESULT, arguments: {'allWord': allWord, 'wordList': wordList, 'laterQueue': laterQueue, 'rememberQueue': rememberQueue});
                                return;
                              }
                              if(isCardLeft){
                                laterQueue.add(wordQueue.removeFirst());
                                historyList.add(0);
                              }
                              else{
                                rememberQueue.add(wordQueue.removeFirst());
                                historyList.add(1);
                              }
                              _animationController2.reverse();
                              _leftValue = isCardLeft ? 20 - windowWidth : windowWidth;
                              _opacityAttachCard = 0;
                              opacityCard = 1;
                            }
                            else{
                              _leftValue2 = isCardLeft ? 20 - windowWidth : windowWidth;
                              setDefaultState(1);
                            }
                          });
                        },
                        child: Stack(
                          children: [
                            AnimatedOpacity(
                              opacity: _opacityAttachCard,
                              duration: Duration(milliseconds: _timePanAttachCard),
                              child: isCardLeft ?
                              Container(
                                width: cardWidth,
                                height: cardHeight,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: const Color(0xffFF8838)),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0x1f000000),
                                          blurRadius: 12,
                                          offset: Offset(0, 4)
                                      )
                                    ]
                                ),
                                child: const Center(child: Text("Still learning", style: TextStyle(fontSize: 34, color: Color(0xffFF8838), fontWeight: FontWeight.w500))),
                              ) : Container(
                                width: cardWidth,
                                height: cardHeight,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: const Color(0xff1CD0AF)),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0x1f000000),
                                          blurRadius: 12,
                                          offset: Offset(0, 4)
                                      )
                                    ]
                                ),
                                child: const Center(child: Text("Know", style: TextStyle(fontSize: 34, color: Color(0xff1CD0AF), fontWeight: FontWeight.w500))),
                              ),
                            ),
                            AnimatedOpacity(
                                opacity: 1 - _opacityAttachCard,
                                duration: const Duration(milliseconds: 10),
                                child: Transform(
                                  alignment: FractionalOffset.center,
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001)
                                    ..rotateY(pi * _animationController.value),
                                  child: GestureDetector(
                                      onTap: () {
                                        print('doo');
                                        _animationController.value <= 0.5 ?
                                        _animationController.forward()
                                            :
                                        _animationController.reverse();
                                      },
                                      child:
                                      FlashCard()
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
                            _animationController.reverse();
                          });
                        },
                        onPanUpdate: (details) {
                          setState(() {
                            _topValue2 += details.delta.dy;
                            _leftValue2 += details.delta.dx;
                            isCardLeft = _leftValue2 < 20;
                            _opacityAttachCard = convertChangedOpacity(_leftValue2.abs());
                          });
                        },
                        onPanEnd: (details) {
                          setState(() {
                            if((_leftValue2 - 20).abs() > valueToSlide){
                              if(wordQueue.length == 1){
                                if(isCardLeft){
                                  laterQueue.add(wordQueue.first);
                                }
                                else{
                                  rememberQueue.add(wordQueue.first);
                                }
                                // Get.offAndToNamed(AppRoutes.FLASH_CARD_RESULT, arguments: {'allWord': allWord, 'wordList': wordList, 'laterQueue': laterQueue, 'rememberQueue': rememberQueue});
                                return;
                              }
                              if(isCardLeft){
                                laterQueue.add(wordQueue.removeFirst());
                                historyList.add(0);
                              }
                              else{
                                rememberQueue.add(wordQueue.removeFirst());
                                historyList.add(1);
                              }
                              _leftValue2 = isCardLeft ? 20 - windowWidth : windowWidth;
                              _opacityAttachCard = 0;
                              opacityCard = 0;
                            }
                            else{
                              _leftValue = isCardLeft ? 20 - windowWidth : windowWidth;
                              setDefaultState(2);
                            }
                          });
                        },
                        child: Stack(
                          children: [
                            AnimatedOpacity(
                              opacity: _opacityAttachCard,
                              duration: Duration(milliseconds: _timePanAttachCard),
                              child: isCardLeft ?
                              Container(
                                width: cardWidth,
                                height: cardHeight,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: const Color(0xffFF8838)),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0x1f000000),
                                          blurRadius: 12,
                                          offset: Offset(0, 4)
                                      )
                                    ]
                                ),
                                child: const Center(child: Text("Still learning", style: TextStyle(fontSize: 34, color: Color(0xffFF8838), fontWeight: FontWeight.w500))),
                              ) : Container(
                                width: cardWidth,
                                height: cardHeight,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: const Color(0xff1CD0AF)),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0x1f000000),
                                          blurRadius: 12,
                                          offset: Offset(0, 4)
                                      )
                                    ]
                                ),
                                child: const Center(child: Text("Know", style: TextStyle(fontSize: 34, color: Color(0xff1CD0AF), fontWeight: FontWeight.w500))),
                              ),
                            ),
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
                                        _animationController2.value <= 0.5 ?
                                        _animationController2.forward()
                                            :
                                        _animationController2.reverse();
                                      },
                                      child:
                                      FlashCard()

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
          Row(
            children: [
              Flexible(
                child: LinearPercentIndicator(
                  lineHeight: 3.0,
                  percent: (laterQueue.length + rememberQueue.length)  / (wordList.length),
                  barRadius: const Radius.circular(4),
                  padding: const EdgeInsets.only(top: 0, left: 0),
                  progressColor: const Color(0xff5885DD),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}



