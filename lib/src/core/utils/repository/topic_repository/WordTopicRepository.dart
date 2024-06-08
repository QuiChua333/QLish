import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/user.dart';
import 'package:qlish/src/data/models/word.dart';
import 'package:qlish/src/data/models/wordLearnt.dart';
import 'package:qlish/src/data/models/wordTopic.dart';

import '../user_repository/UserRepository.dart';


class WordTopicRepository extends GetxController {
  static WordTopicRepository get instance => Get.find();
  final _userRepo = UserRepository.instance;
  final _db = FirebaseFirestore.instance;


  Future<List<WordTopicModel>> getAllTopic () async {

    final snapshot = await _db.collection('wordTopic').get();
    final topics = snapshot.docs.map((e) => WordTopicModel.fromFirebase(e)).toList();
    for (int i =0 ;i <topics.length; i++) {
      WordTopicModel topic = topics[i];
      List<WordModel> listWordsForTopic = await getWordsForTopic(topic.id);
      topic.words = listWordsForTopic;
    }
    return topics;
  }

  Future<List<WordModel>> getWordsForTopic(String? wordTopicId) async {
    final querySnapshot = await _db.collection('word')
        .where('wordTopicId', isEqualTo: wordTopicId)
        .get();
    final listWordsForTopic = querySnapshot.docs.map((e) => WordModel.fromFirebase(e)).toList();
    return listWordsForTopic;
  }

  Future<int> countWordsForTopic(String wordTopicId) async {
    final querySnapshot = await _db.collection('word')
        .where('wordTopicId', isEqualTo: wordTopicId)
        .get();
    return querySnapshot.docs.length;
  }


  Future<List<WordLearntModel>> fetchLearntWordsForUserByTopic() async {
    print(_userRepo.currentUser.id);
    final querySnapshot = await _db.collection('wordLearnt')
        .where('userId', isEqualTo: _userRepo.currentUser.id)
        .where('wordId')
        .get();
    return querySnapshot.docs.map((doc) => WordLearntModel.fromFirebase(doc)).toList();
  }
}
