
import 'package:cloud_firestore/cloud_firestore.dart';

const defaultAvatar = 'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg';
class SentenceLearntModel {
  final String? sentenceId;
  final String userId;

  SentenceLearntModel({
    this.sentenceId,
    required this.userId,
  });


  toJson() {
    return {
      "sentenceId": sentenceId,
      "userId": userId,
    };
  }
  factory SentenceLearntModel.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot;
    return SentenceLearntModel(
      sentenceId: data["sentenceId"],
      userId: data["userId"],
    );
  }



  }



