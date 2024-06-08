import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/sentence.dart';
import 'package:qlish/src/data/models/sentenceLearnt.dart';
import 'package:qlish/src/data/models/sentenceTopic.dart';
import 'package:qlish/src/data/models/user.dart';
import 'package:qlish/src/data/models/word.dart';
import 'package:qlish/src/data/models/wordLearnt.dart';
import 'package:qlish/src/data/models/wordTopic.dart';

import '../user_repository/UserRepository.dart';


class SentenceTopicRepository extends GetxController {
  static SentenceTopicRepository get instance => Get.find();
  final _userRepo = UserRepository.instance;
  final _db = FirebaseFirestore.instance;


  Future<List<SentenceTopicModel>> getAllTopic () async {

    final snapshot = await _db.collection('sentenceTopic').get();
    final topics = snapshot.docs.map((e) => SentenceTopicModel.fromFirebase(e)).toList();
    for (int i =0 ;i <topics.length; i++) {
      SentenceTopicModel topic = topics[i];
      List<SentenceModel> listSentencesForTopic = await getSentencesForTopic(topic.id);
      topic.sentences = listSentencesForTopic;
    }
    return topics;
  }

  Future<List<SentenceModel>> getSentencesForTopic(String? wordTopicId) async {
    final querySnapshot = await _db.collection('sentence')
        .where('sentenceTopicId', isEqualTo: wordTopicId)
        .get();
    final lisSentencesForTopic = querySnapshot.docs.map((e) => SentenceModel.fromFirebase(e)).toList();
    return lisSentencesForTopic;
  }

  Future<int> countWordsForTopic(String wordTopicId) async {
    final querySnapshot = await _db.collection('word')
        .where('wordTopicId', isEqualTo: wordTopicId)
        .get();
    return querySnapshot.docs.length;
  }


  Future<List<SentenceLearntModel>> fetchLearntSentencesForUserByTopic() async {
    final querySnapshot = await _db.collection('sentenceLearnt')
        .where('userId', isEqualTo: _userRepo.currentUser.id)
        .get();
    return querySnapshot.docs.map((doc) => SentenceLearntModel.fromFirebase(doc)).toList();
  }
}
