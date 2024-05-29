
import 'package:cloud_firestore/cloud_firestore.dart';

const defaultAvatar = 'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg';
class WordTopicModel {
  final String? id;
  final String wordTopicName;
  final String image;




  const WordTopicModel({
    this.id,
    required this.wordTopicName,
    required this.image,
  });


  toJson() {
    return {
      "wordTopicName": wordTopicName,
      "image": image,
    };
  }
  factory WordTopicModel.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return WordTopicModel(
      id: data["id"],
      wordTopicName: data["wordTopicName"],
      image: data["image"],
    );
  }

}
