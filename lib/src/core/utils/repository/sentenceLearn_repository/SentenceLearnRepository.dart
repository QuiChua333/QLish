import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/user.dart';
import 'package:qlish/src/data/models/wordTopic.dart';

import '../../../../data/models/wordLearnt.dart';
import '../user_repository/UserRepository.dart';


class SentenceLearnRepository extends GetxController {

  static SentenceLearnRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;


  Future<void> saveLearntSentenceToFirestore(String? sentenceId) async {
    final userId = UserRepository.instance.currentUser.id;
    await _db.collection('sentenceLearnt').add({
      "userId": userId,
      "sentenceId": sentenceId
    });
  }
}
