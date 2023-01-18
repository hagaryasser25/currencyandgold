import 'package:flutter/cupertino.dart';

class Company {
  Company({
    String? id,
    String? companyPrice,
    int? date,
  }) {
    _id = id;
   _companyPrice = companyPrice;
    _date = date;
  }

  Company.fromJson(dynamic json) {
    _id = json['id'];
    _companyPrice = json['companyPrice'];
    _date = json['date'];
  }

  String? _id;
  String?_companyPrice;
  int? _date;

  String? get id => _id;
  String? get companyPrice =>_companyPrice;
  int? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['companyPrice'] =_companyPrice;
    map['date'] = _date;

    return map;
  }
}