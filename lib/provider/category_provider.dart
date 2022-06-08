import 'package:astrotak/data/model/category.dart';
import 'package:flutter/cupertino.dart';

class Categoryprovider extends ChangeNotifier {
  Category _category = Category(
      httpStatus: '', httpStatusCode: 0, success: false, message: '', data: []);

  Category get category => _category;

  void setCategory(Category category) {
    _category = category;
    notifyListeners();
  }
}
