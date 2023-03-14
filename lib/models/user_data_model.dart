import 'package:flutter/cupertino.dart';

class UsersData {
  UsersData({
    int? dt,
    String? uid,
    String? name,
    String? email,
    String? phoneNumber,
    String? imageUrl,
  }) {
    _dt = dt;
    _uid = uid;
    _name = name;
    _email = email;
    _phoneNumber = phoneNumber;
    _imageUrl = imageUrl;
  }

  UsersData.fromJson(dynamic json) {
    _dt = json['dt'];
    _uid = json['uid'];
    _name = json['fullName'];
    _email = json['email'];
    _phoneNumber = json['phoneNumber'];
    _imageUrl = json['imageUrl'];
  }

  int? _dt;
  String? _uid;
  String? _name;
  String? _email;
  String? _phoneNumber;
  String? _imageUrl;

  int? get dt => _dt;
  String? get uid => _uid;
  String? get name => _name;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = _dt;
    map['uid'] = _uid;
    map['fullName'] = _name;
    map['email'] = _email;
    map['phoneNumber'] = _phoneNumber;
    map['imageUrl'] = _imageUrl;

    return map;
  }
}