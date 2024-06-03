
import 'package:cloud_firestore/cloud_firestore.dart';

const defaultAvatar = 'https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg';
class UserModel {
  final String? id;
  final String email;
  final String password;
  final String name;
  final String rank;
  final int score;
  final String avatar;




   UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.name,
     this.rank = 'Đồng',
     this.score = 0,
     this.avatar = defaultAvatar,
  });




  toJson() {
    return {
      "email": email,
      "name": name,
      "password": password,
      "rank": rank,
      "score": score,
      "avatar": avatar,
    };
  }
  factory UserModel.fromFirebase(DocumentSnapshot snapshot) {
    var data = snapshot;
    return UserModel(
      id: data.id,
      name: data["name"],
      email: data["email"],
      avatar: data["avatar"],
      password: data["password"],
      rank: data['rank'],
      score: data['score'],
    );
  }



}
