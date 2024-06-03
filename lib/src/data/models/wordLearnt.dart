
import 'package:cloud_firestore/cloud_firestore.dart';

const defaultAvatar = 'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg';
class WordLearntModel {
  final String? wordId;
  final String userId;
  final bool isSpell;

  WordLearntModel({
    this.wordId,
    required this.userId,
    required this.isSpell,
  });


  toJson() {
    return {
      "wordId": wordId,
      "userId": userId,
      "isSpell": isSpell,
    };
  }
  factory WordLearntModel.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot;
    return WordLearntModel(
      wordId: data["wordId"],
      userId: data["userId"],
      isSpell: data["isSpell"],
    );
  }



  }



