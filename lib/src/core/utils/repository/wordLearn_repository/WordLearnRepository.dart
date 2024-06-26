import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/user.dart';
import 'package:qlish/src/data/models/wordTopic.dart';

import '../../../../data/models/word.dart';
import '../../../../data/models/wordLearnt.dart';
import '../../../../data/models/wordTopicWithLearntCount .dart';


class WordLearnRepository extends GetxController {

  static WordLearnRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async  {
    await _db
        .collection("user")
        .add(user.toJson())
        .whenComplete(() =>
        ToastMessage.show('Tạo tài khoản thành công', ToastMessage.SUCCESS))
        .catchError((error, stackTrace) {
      ToastMessage.show('Đã có lỗi xảy ra, vui lòng thử lại', ToastMessage.ERROR);
      print(error.toString());
    });
  }

  // Future<UserModel> getUserDetail (String email) async {
  //
  //
  //   final snapshot = await _db.collection('user').where('email', isEqualTo: email ).get();
  //   final userData = snapshot.docs.map((e) => UserModel.fromFirebase(e)).single;
  //   currentUser = userData;
  //   return userData;
  // }
  Future<void> saveLearntWordsToFirestore(List<WordLearntModel> learntWords) async {
    for (var learntWord in learntWords) {
      try {
        await _db.collection('wordLearnt').add(learntWord.toJson());
      } catch (e) {
        print('Lỗi khi lưu learntWord: $e');
      }
    }
  }


  // Hàm lấy tất cả wordTopic từ Firestore
  Future<List<WordTopicModel>> getAllWordTopics() async {
    QuerySnapshot snapshot = await _db.collection('wordTopic').get();
    return snapshot.docs.map((doc) => WordTopicModel.fromFirebase(doc)).toList();
  }

  // Hàm lấy tất cả word từ Firestore
  Future<List<WordModel>> getAllWords() async {
    QuerySnapshot snapshot = await _db.collection('word').get();
    return snapshot.docs.map((doc) => WordModel.fromFirebase(doc)).toList();
  }

  // Hàm lấy tất cả wordLearnt từ Firestore
  Future<List<WordLearntModel>> getAllWordLearnts() async {
    QuerySnapshot snapshot = await _db.collection('wordLearnt').get();
    return snapshot.docs.map((doc) => WordLearntModel.fromFirebase(doc)).toList();
  }

  // Hàm lấy tất cả wordTopic kèm theo số lượng wordLearnt tương ứng
  Future<List<WordTopicWithLearntCount>> getWordTopicsWithLearntCount() async {
    // Lấy tất cả wordTopic
    List<WordTopicModel> wordTopics = await getAllWordTopics();

    // Lấy tất cả word
    List<WordModel> words = await getAllWords();

    // Lấy tất cả wordLearnt
    List<WordLearntModel> wordLearnts = await getAllWordLearnts();

    // Tạo danh sách để lưu kết quả
    List<WordTopicWithLearntCount> result = [];

    // Đếm số lượng wordLearnt cho mỗi wordTopic
    for (var wordTopic in wordTopics) {
      // Lấy danh sách các từ thuộc về wordTopic này
      List<WordModel> wordsOfTopic = words.where((word) => word.wordTopicId == wordTopic.id).toList();

      // Đếm số lượng wordLearnt có id của các từ này
      List<WordModel> learntWords = wordsOfTopic.where((element) => wordLearnts.any((learnt) => learnt.wordId == element.id)).toList();

      // Thêm vào danh sách kết quả
      result.add(WordTopicWithLearntCount(wordTopic: wordTopic, listWords: learntWords));
    }

    return result;
  }
}
