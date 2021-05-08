import 'dart:convert';

class UserModel {
  String? username;
  String? password;
  String? name;
  String? photoUrl;
  int? score;

  UserModel({
    this.username,
    this.password,
    this.name,
    this.photoUrl,
    this.score = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoUrl': photoUrl,
      'score': score,
      'username': username,
      'password': password
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      photoUrl: map['photoUrl'],
      score: map['score'],
      password: map['password'],
      username: map['username'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
