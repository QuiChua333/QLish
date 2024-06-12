
import 'package:cloud_firestore/cloud_firestore.dart';

const defaultAvatar = 'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg';
class IPAModel {
  final String? id;
  final String ipa;
  final String exampleWord;
  final String audio;
  final int stt;
  final String type;




  IPAModel({
    this.id,
    required this.ipa,
    required this.exampleWord,
    required this.audio,
    required this.stt,
    required this.type,

  });




  toJson() {
    return {
      "ipa": ipa,
      "exampleWord": exampleWord,
      "audio": audio,
      "stt": stt,
      "type": type,
    };
  }
  factory IPAModel.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot;
    return IPAModel(
      id: data.id,
      ipa: data["ipa"],
      exampleWord: data["exampleWord"],
      audio: data["audio"],
      stt: data["stt"],
      type: data['type'],
    );
  }



}
