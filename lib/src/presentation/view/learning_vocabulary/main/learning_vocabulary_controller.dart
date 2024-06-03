import 'dart:math';

import 'package:get/get.dart';
import 'package:qlish/src/core/utils/repository/authentication_repository/authentication_repository.dart';
import 'package:qlish/src/core/utils/repository/topic_repository/WordTopicRepository.dart';
import 'package:qlish/src/core/utils/repository/user_repository/UserRepository.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/user.dart';
import 'package:qlish/src/data/models/wordTopic.dart';

import '../../../../data/models/word.dart';

class LearningVocabularyController extends GetxController {
  final _wordTopicRepo = Get.put(WordTopicRepository());
  late List<WordTopicModel> allWordTopics = [];
  late int? indexActive = -1;

  @override
  void onInit() async {
    super.onInit();
    await getAllWordTopics();
    update();

  }

  Future<void> getAllWordTopics() async {
    allWordTopics = await _wordTopicRepo.getAllTopic();
  }

  Future<void> getStatusRounds(String? wordTopicId, int? index) async {
      WordTopicModel wordTopicModel = allWordTopics.firstWhere((element) => element.id == wordTopicId);
      final rounds = await splitWordsIntoRounds(wordTopicModel,10);
      
      wordTopicModel.listRounds = rounds;
      indexActive = index;
      update();

  }

  Future<List<Map<String,dynamic>>> splitWordsIntoRounds( WordTopicModel wordTopicModel ,int roundSize) async {

    // Lấy danh sách wordIds
    final wordIds = wordTopicModel.words?.map((word) => word.id).toList();

    // Truy vấn bảng learnt để lấy các từ đã học của người dùng
    final learntWords = await _wordTopicRepo.fetchLearntWordsForUserByTopic();

    // Lọc danh sách từ của chủ đề để lấy những từ đã học
    final learntWordIds = learntWords.map((learntWord) => learntWord.wordId).toSet();
    final learntWordList = wordTopicModel.words?.where((word) => learntWordIds.contains(word.id)).toList();

    // Lọc danh sách từ còn lại (không thuộc learntWordList)
    final remainingWordList = wordTopicModel.words?.where((word) => !learntWordIds.contains(word.id)).toList();

    // Trộn ngẫu nhiên các từ còn lại
    remainingWordList?.shuffle(Random());

    // Khởi tạo danh sách kết quả
    List<List<WordModel>> rounds = [];

    // Thêm các từ đã học vào hai round đầu tiên
    int learnNum = 0;
    for (int i = 0; i < learntWordList!.length; i += roundSize) {
      learnNum++;
      rounds.add(learntWordList.sublist(i, i + roundSize > learntWordList.length ? learntWordList.length : i + roundSize));
    }

    // Thêm các từ còn lại vào các round tiếp theo
    for (int i = 0; i < remainingWordList!.length; i += roundSize) {
      rounds.add(remainingWordList.sublist(i, i + roundSize > remainingWordList.length ? remainingWordList.length : i + roundSize));
    }

    // Đảm bảo có đủ roundSize từ trong mỗi round
    while (rounds.isNotEmpty && rounds.last.length < roundSize) {
      final lastRound = rounds.removeLast();
      if (rounds.isNotEmpty) {
        rounds.last.addAll(lastRound);
      } else {
        rounds.add(lastRound);
      }
    }
    final List<Map<String,dynamic>> listRound = [];
    print('learnnum' + '${learnNum}');
    for (int i=0; i<rounds.length; i++) {
      String status = '';
      status = i < learnNum ? 'Đã hoàn thành' : 'Chưa hoàn thành';
      Map<String,dynamic> mp = {
        "round": i+1,
        "learnStatus": status,
        "practiceStatus": 'Chưa hoàn thành'
      };
      listRound.add(mp);
    }
    return listRound;
  }
}