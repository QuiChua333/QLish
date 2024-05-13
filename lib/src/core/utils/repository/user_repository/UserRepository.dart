import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlish/src/core/utils/toast_message/toast_message.dart';
import 'package:qlish/src/data/models/user.dart';


class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

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
}
