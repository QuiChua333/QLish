
import 'package:cloud_firestore/cloud_firestore.dart';

const defaultAvatar = 'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg';
class TestModel {
  final String? id;
  final String name;
  final String mean;
  final String phonetic;
  final String wordType;
  final String image;




  TestModel({
    this.id,
    required this.name,
    required this.mean,
    required this.phonetic,
    required this.wordType,
     this.image = defaultAvatar,
  });


  toJson() {
    return {
      "name": name,
      "mean": mean,
      "phonetic": phonetic,
      "wordType": wordType,
      "image": image,
    };
  }
  factory TestModel.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot;
    return TestModel(
      id: data.id,
      name: data["name"],
      mean: data["mean"],
      phonetic: data["phonetic"],
      wordType: data["wordType"],
      image: data['image'],
    );
  }

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      id:json["id"],
      name:json["name"],
      mean:json["mean"],
      phonetic:json["phonetic"],
      wordType:json["wordType"],
      image:json["image"],
    );

  }


}
