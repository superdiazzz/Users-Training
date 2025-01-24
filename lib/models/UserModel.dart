import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    required this.id,
    this.name,
    this.avatar,
    this.email,
    this.createdAt,
  });

  /// Constructor for creating a `UserModel` from JSON
  UserModel.fromJson(Map<String, dynamic> json, String idnum) {
    id = idnum;
    name = json['name'] as String?;
    avatar = json['avatar'] as String?;
    email = json['email'] as String?;
    createdAt = json['createdAt'] != null
        ? (json['createdAt'] as Timestamp)
        : null;
  }

  /// Fields
  String? id;
  String? name;
  String? avatar;
  String? email;
  Timestamp? createdAt;

  /// Copy with method for immutability
  UserModel copyWith({
    String? id,
    String? name,
    String? avatar,
    String? email,
    Timestamp? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Convert the model into JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'email': email,
      'createdAt': createdAt?.toDate().toIso8601String(), // Serialize Timestamp
    };
  }
}