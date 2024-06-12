import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/repository/user_repository/UserRepository.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/test.dart';
import 'package:qlish/src/data/models/user.dart';
import 'package:qlish/src/data/models/wordSaved.dart';
import 'package:qlish/src/data/models/wordTopic.dart';
import 'package:qlish/src/data/models/wordTopicWithSavedCount%20.dart';

import '../../../../data/models/word.dart';
import '../../../../data/models/wordLearnt.dart';


class TestRepository extends GetxController {

  static TestRepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;



  Future<List<TestModel>> getListTest () async {


    final snapshot = await _db.collection('test').get();
    final listWordsForTopic = snapshot.docs.map((e) => TestModel.fromFirebase(e)).toList();
    return listWordsForTopic;
  }


}
