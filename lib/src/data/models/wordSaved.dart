
import 'package:cloud_firestore/cloud_firestore.dart';

const defaultAvatar = 'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg';
class WordSavedModel {
  final String? wordId;
  final String userId;

  WordSavedModel({
    this.wordId,
    required this.userId,
  });


  toJson() {
    return {
      "wordId": wordId,
      "userId": userId,
    };
  }
  factory WordSavedModel.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot;
    return WordSavedModel(
      wordId: data["wordId"],
      userId: data["userId"],
    );
  }



  }



