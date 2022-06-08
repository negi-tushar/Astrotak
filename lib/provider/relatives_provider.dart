import 'dart:convert';
import 'package:astrotak/data/model/relatives.dart';
import 'package:flutter/cupertino.dart';

class RelativesProvider extends ChangeNotifier {
  AllRelativeData _allRelativesData = AllRelativeData(allRelatives: []);

  AllRelativeData get allRelativesData => _allRelativesData;

  void setRelativesData(AllRelativeData data) {
    _allRelativesData = data;
    notifyListeners();
  }
}
