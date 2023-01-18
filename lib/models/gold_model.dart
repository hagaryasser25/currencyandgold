import 'package:flutter/cupertino.dart';

class Gold {
  Gold({
    String? id,
    String? goldPrice,
    int? date,
  }) {
    _id = id;
    _goldPrice = goldPrice;
    _date = date;
  }

  Gold.fromJson(dynamic json) {
    _id = json['id'];
    _goldPrice = json['goldPrice'];
    _date = json['date'];
  }

  String? _id;
  String? _goldPrice;
  int? _date;

  String? get id => _id;
  String? get price => _goldPrice;
  int? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['goldPrice'] = _goldPrice;
    map['date'] = _date;

    return map;
  }
}
