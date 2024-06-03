
import 'package:cloud_firestore/cloud_firestore.dart';

const defaultAvatar = 'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg';
class WordModel {
  final String? id;
  final String name;
  final String mean;
  final String phonetic;
  final String wordTopicId;
  final String wordType;
  final String image;




   WordModel({
    this.id,
    required this.name,
    required this.mean,
    required this.phonetic,
    required this.wordType,
    required this.wordTopicId,
     this.image = defaultAvatar,
  });


  toJson() {
    return {
      "name": name,
      "mean": mean,
      "phonetic": phonetic,
      "wordType": wordType,
      "wordTopicId": wordTopicId,
      "image": image,
    };
  }
  factory WordModel.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot;
    return WordModel(
      id: data.id,
      name: data["name"],
      mean: data["mean"],
      phonetic: data["phonetic"],
      wordType: data["wordType"],
      wordTopicId: data['wordTopicId'],
      image: data['image'],
    );
  }

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      id:json["id"],
      name:json["name"],
      mean:json["mean"],
      phonetic:json["phonetic"],
      wordType:json["wordType"],
      wordTopicId:json["wordTopicId"],
      image:json["image"],
    );

  }


}
