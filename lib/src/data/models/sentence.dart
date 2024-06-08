
import 'package:cloud_firestore/cloud_firestore.dart';

const defaultAvatar = 'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg';
class SentenceModel {
  final String? id;
  final String sentence;
  final String mean;
  final String video;
  final int startAt;
  late bool? isLearnt;





  SentenceModel({
    this.id,
    required this.sentence,
    required this.mean,
    required this.video,
    required this.startAt,
  });


  toJson() {
    return {
      "sentence": sentence,
      "mean": mean,
      "video": video,
      "startAt": startAt,

    };
  }
  factory SentenceModel.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot;
    return SentenceModel(
      id: data.id,
      sentence: data["sentence"],
      mean: data["mean"],
      video: data["video"],
      startAt: data["startAt"],
    );
  }

  factory SentenceModel.fromJson(Map<String, dynamic> json) {
    return SentenceModel(
      id:json["id"],
      sentence:json["sentence"],
      mean:json["mean"],
      video:json["video"],
      startAt: json["startAt"],

    );

  }


}
