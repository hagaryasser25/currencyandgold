import 'package:flutter/cupertino.dart';

class Currency with ChangeNotifier {
  Currency({
    String? name,
    String? currencyPrice,
    int? date,
    String? id,
  }) {
    _name = name;
    _currencyPrice = currencyPrice;
    _date = date;
    _id = id;
  }

  Currency.fromJson(dynamic json) {
    _name = json['name'];
    _currencyPrice = json['currencyPrice'];
    _date = json['date'];
    _id = json['id'];
  }

  String? _name;
  String? _currencyPrice;
  int? _date;
  String? _id;

  String? get name => _name;
  String? get currencyPrice => _currencyPrice;
  int? get date => _date;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['currencyPrice'] = _currencyPrice;
    map['date'] = _date;
    map['id'] = _id;

    return map;
  }
}
