import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/user.dart';
import 'package:qlish/src/data/models/wordTopic.dart';


class UserRepository extends GetxController {

  static UserRepository get instance => Get.find();
  UserModel _currentUser = UserModel(email: '', name: '', password: '');

  UserModel get currentUser => _currentUser;

  set currentUser(UserModel userModel) {
    _currentUser = userModel;
  }
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

  Future<UserModel> getUserDetail (String email) async {


    final snapshot = await _db.collection('user').where('email', isEqualTo: email ).get();
    final userData = snapshot.docs.map((e) => UserModel.fromFirebase(e)).single;
    currentUser = userData;
    return userData;
  }

  Future<List<UserModel>> getListUser () async {


    final snapshot = await _db.collection('user').get();
    final listWordsForTopic = snapshot.docs.map((e) => UserModel.fromFirebase(e)).toList();
    return listWordsForTopic;
  }

  Future<void> addStar({String? type}) async{
    if (type == 'word') {
      await FirebaseFirestore.instance.collection('user').doc(currentUser.id).update({
        'score': currentUser.score + 2,
      });
    }
    if (type == 'sentence') {
      await FirebaseFirestore.instance.collection('user').doc(currentUser.id).update({
        'score': currentUser.score + 5,
      });
    }
    if (type == 'exam') {
      await FirebaseFirestore.instance.collection('user').doc(currentUser.id).update({
        'score': currentUser.score + 10,
      });
    }

  }

  Future<void> changeTestSuccess({int? level}) async{


    await FirebaseFirestore.instance.collection('user').doc(currentUser.id).update({
      'isTested': true,
      'level': level
    });

  }
}
