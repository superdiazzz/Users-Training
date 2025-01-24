import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
      this.name, 
      this.avatar, 
      this.email, 
      this.createdAt,});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
    email = json['email'];
    createdAt = json['createdAt'] as Timestamp?;
  }
  String? name;
  String? avatar;
  String? email;
  Timestamp? createdAt;
UserModel copyWith({  String? name,
  String? avatar,
  String? email,
  Timestamp? createdAt,
}) => UserModel(  name: name ?? this.name,
  avatar: avatar ?? this.avatar,
  email: email ?? this.email,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['avatar'] = avatar;
    map['email'] = email;
    map['createdAt'] = createdAt;
    return map;
  }

}