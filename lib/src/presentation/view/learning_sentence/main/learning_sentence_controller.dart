import 'dart:math';

import 'package:get/get.dart';
import 'package:qlish/src/core/utils/repository/authentication_repository/authentication_repository.dart';
import 'package:qlish/src/core/utils/repository/topic_repository/SentenceTopicRepository.dart';
import 'package:qlish/src/core/utils/repository/topic_repository/WordTopicRepository.dart';
import 'package:qlish/src/core/utils/repository/user_repository/UserRepository.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/sentenceTopic.dart';
import 'package:qlish/src/data/models/user.dart';
import 'package:qlish/src/data/models/wordTopic.dart';

import '../../../../data/models/word.dart';

class LearningSentenceController extends GetxController {
  final _sentenceTopicRepo = Get.put(SentenceTopicRepository());
  late List<SentenceTopicModel> allSentenceTopics = [];
  late int? indexActive = -1;
  List<List<WordModel>> roundsController = [];

  @override
  void onInit() async {
    super.onInit();
    await getAllWordTopics();
    update();

  }

  Future<void> getAllWordTopics() async {
    allSentenceTopics = await _sentenceTopicRepo.getAllTopic();
  }



  Future<void> getStatusRounds(String? sentenceTopicId, int? index) async {
    SentenceTopicModel sentenceTopicModel = allSentenceTopics.firstWhere((element) => element.id == sentenceTopicId);
    final rounds = await getSentencesWithLearningStatus(sentenceTopicModel);
    sentenceTopicModel.listRounds = rounds;
    indexActive = index;
    update();

  }

  Future<List<Map<String, dynamic>>> getSentencesWithLearningStatus(SentenceTopicModel sentenceTopicModel) async {

    final learntSentences = await _sentenceTopicRepo.fetchLearntSentencesForUserByTopic();

    // Lấy danh sách các id của câu đã học
    List<String?> learntSentenceIds = learntSentences.map((doc) => doc.sentenceId).toList();

    // Tạo danh sách kết quả để lưu trữ các câu cùng với trạng thái đã học
    List<Map<String, dynamic>> result = [];

    // Duyệt qua danh sách câu của chủ đề
    final List<Map<String,dynamic>> listRound = [];
    for (int i=0; i<sentenceTopicModel.sentences.length; i++) {
      String status = '';
      bool isLearnt = learntSentenceIds.contains(sentenceTopicModel.sentences[i].id);
      status = isLearnt ? 'Đã hoàn thành' : 'Chưa hoàn thành';
      Map<String,dynamic> mp = {
        "round": i+1,
        "status": status,
      };
      listRound.add(mp);
    }
    return listRound;

  }


}