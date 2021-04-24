import 'dart:convert';

class AnswerdModel {
  final String title;
  final bool isRight;

  AnswerdModel({
    required this.title,
    this.isRight = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isRight': isRight,
    };
  }

  factory AnswerdModel.fromMap(Map<String, dynamic> map) {
    return AnswerdModel(
      title: map['title'],
      isRight: map['isRight'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerdModel.fromJson(String source) =>
      AnswerdModel.fromMap(json.decode(source));
}
