import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/user.dart';
import 'package:qlish/src/data/models/wordTopic.dart';

import '../../../../data/models/wordLearnt.dart';


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
}
