// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:astrotak/provider/category_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:astrotak/data/model/category.dart';
import 'package:provider/provider.dart';

class FetchCategoryData {
  void getCategory(BuildContext context) async {
    try {
      var response = await http.get(
        Uri.parse('https://staging-api.astrotak.com/api/question/category/all'),
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        // print(data['data']);
        var categories = Category.fromJson(data);
        Provider.of<Categoryprovider>(context, listen: false)
            .setCategory(categories);
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
