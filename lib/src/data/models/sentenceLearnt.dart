
import 'package:cloud_firestore/cloud_firestore.dart';

const defaultAvatar = 'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg';
class SentenceLearntModel {
  final String? sentenceId;
  final String userId;
  final bool isSpeed;

  SentenceLearntModel({
    this.sentenceId,
    required this.userId,
    required this.isSpeed,
  });


  toJson() {
    return {
      "sentenceId": sentenceId,
      "userId": userId,
      "isSpeed": false,
    };
  }
  factory SentenceLearntModel.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot;
    return SentenceLearntModel(
      sentenceId: data["sentenceId"],
      userId: data["userId"],
      isSpeed: data["isSpeed"],
    );
  }



  }



