
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qlish/src/data/models/word.dart';

const defaultAvatar = 'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg';
class WordTopicModel {
  final String? id;
  final String wordTopicName;
  final String image;
  int? lengthWords;
  List<WordModel>? words;
  List<Map<String,dynamic>>? listRounds =[];



   WordTopicModel({
    this.id,
    required this.wordTopicName,
    required this.image,
    this.lengthWords,
     this.words,
     this.listRounds
  });

  int getNumRoundFinish() {
    return this.listRounds?.where((element) => element['status'] == 'Đã hoàn thành').toList().length ?? 0;
  }



  toJson() {
    return {
      "wordTopicName": wordTopicName,
      "image": image,
    };
  }
  factory WordTopicModel.fromFirebase(DocumentSnapshot snapshot) {

    return WordTopicModel(
      id: snapshot.id,
      wordTopicName: snapshot["wordTopicName"],
      image: snapshot["image"],
    );
  }

}
