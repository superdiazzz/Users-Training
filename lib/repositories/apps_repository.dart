
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_training/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppsRepository{

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;


  static const String _statusUser = 'statusUser';
  static const String _urlPath = 'urlPath';

  Future<UserModel> getUserDetail() async {
    try{
      final user = _auth.currentUser;
      final qs = await _firestore.collection('users')
          .doc(user!.uid)
          .get();

      if(qs.exists){
        return UserModel.fromJson(qs.data()!);
      }else{
        throw Exception('user is not exists');
      }
    }catch(e){
      throw Exception(e);
    }
  }

  Future<List<UserModel>> getUsers() async {
    try{
      final qs = await _firestore.collection('users').get();

      return qs.docs.map((doc) {
        final user = UserModel.fromJson(doc.data());
        return user;
      }).toList();

    }catch(e){
      throw Exception(e);
    }
  }


  Future<void> saveImage(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_urlPath, url);
  }

  Future<String?> getImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_urlPath);
  }

  Future<void> saveStatus(Map<String, dynamic> status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_statusUser, jsonEncode(status));
  }

  Future<String?> getStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_statusUser) ?? '';
  }

}