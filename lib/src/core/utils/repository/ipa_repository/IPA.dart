import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/ipa.dart';
import 'package:qlish/src/data/models/user.dart';
import 'package:qlish/src/data/models/wordTopic.dart';

import '../../../../data/models/wordLearnt.dart';


class IPARepository extends GetxController {

  static IPARepository get instance => Get.find();


  final _db = FirebaseFirestore.instance;




  Future<List<IPAModel>> getLisIPAs () async {


    final snapshot = await _db.collection('ipa').get();
    final listIPAs = snapshot.docs.map((e) => IPAModel.fromFirebase(e)).toList();
    return listIPAs;
  }
}
