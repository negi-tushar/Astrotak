import 'dart:convert';

import 'package:astrotak/data/model/relatives.dart';
import 'package:http/http.dart' as http;

class GetPlace {
  Future<List<BirthPlace>> getPlaceDetails(String place) async {
    List<BirthPlace> birthPlace = [];

    try {
      if (place.length > 2) {
        var response = await http.get(
          Uri.parse(
              'https://staging-api.astrotak.com/api/location/place?inputPlace=$place'),
        );
        if (response.statusCode == 200) {
          var data = json.decode(response.body);
          // print(data['data']);
          var listdata = data['data'] as List;
          for (var element in listdata) {
            birthPlace.add(BirthPlace.fromJson(element));
          }
          return birthPlace;
        }

        return birthPlace;
      }
    } catch (e) {
      print(e);
    }
    return birthPlace;
  }
}
