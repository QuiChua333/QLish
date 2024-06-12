import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/repository/user_repository/UserRepository.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/user.dart';
import 'package:qlish/src/data/models/wordTopic.dart';

import '../../../../data/models/wordLearnt.dart';


class SavedSentenceRepository extends GetxController {

  static SavedSentenceRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;


  Future<void> saveLearntWordsToFirestore(List<WordLearntModel> learntWords) async {
    for (var learntWord in learntWords) {
      try {
        await _db.collection('wordLearnt').add(learntWord.toJson());
      } catch (e) {
        print('Lỗi khi lưu learntWord: $e');
      }
    }
  }


  Future<void> saveSentence(String? sentenceId) async {
    final userId = UserRepository.instance.currentUser.id;
    await _db.collection('savedSentence').add({
      "userId": userId,
      "sentenceId": sentenceId
    });
  }
  Future<void> unSavedSentence(String? sentenceId) async {
    final userId = UserRepository.instance.currentUser.id;
    QuerySnapshot querySnapshot = await _db.collection('savedSentence')
        .where('userId', isEqualTo: userId)
        .where('sentenceId', isEqualTo: sentenceId)
        .get();

    // Duyệt qua các kết quả truy vấn và xóa từng document
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      await FirebaseFirestore.instance.collection('savedSentence')
          .doc(doc.id)
          .delete();
    }
  }
}
