
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qlish/src/data/models/sentence.dart';
import 'package:qlish/src/data/models/word.dart';

const defaultAvatar = 'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg';
class SentenceTopicModel {
  final String? id;
  final String sentenceTopic;
  final String image;
  int? lengthWords;
  List<SentenceModel> sentences = [];
  List<Map<String,dynamic>>? listRounds =[];



  SentenceTopicModel({
    this.id,
    required this.sentenceTopic,
    required this.image,
    this.lengthWords,
     this.listRounds
  });

  int getNumRoundFinish() {
    return this.listRounds?.where((element) => element['status'] == 'Đã hoàn thành').toList().length ?? 0;
  }



  toJson() {
    return {
      "sentenceTopicName": sentenceTopic,
      "image": image,
    };
  }
  factory SentenceTopicModel.fromFirebase(DocumentSnapshot snapshot) {

    return SentenceTopicModel(
      id: snapshot.id,
      sentenceTopic: snapshot["sentenceTopic"],
      image: snapshot["image"],
    );
  }

}
