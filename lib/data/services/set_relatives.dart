// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:astrotak/data/model/relatives.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SetRelativesData {
  void setRelativesData(
      {required String url,
      required BuildContext context,
      required BirthDetails birthDetails,
      required BirthPlace birthPlace,
      required String firstName,
      required String lastName,
      required int relationId,
      required String gender}) async {
    try {
      var headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVHlwZSI6IkFHRU5UIiwidXVpZCI6ImIyYWViYjMwLThmM2YtMTFlYy05Y2I2LWY3ZTNmNjY2YTIyMyIsImlzRW1haWxWZXJpZmllZCI6dHJ1ZSwicGhvbmVOdW1iZXIiOiI5NzExMTgxMTk4IiwiZW1haWwiOiJyYWtlc2hzaGFybWEuamFpQGdtYWlsLmNvbSIsIm1hc2tlZEVtYWlsIjoicmFrKioqKioqKioqKioqKmdtYWlsLmNvbSIsImV4aXN0aW5nVXNlciI6ZmFsc2UsImlhdCI6MTY0Nzk0NTA0MSwiZXhwIjoxNjY3OTQ1MDQxfQ.Ng9sm0iJbY7_8BALAq31092He6gOIkmWUMw1dwzsg2E',
        'Content-Type': 'application/json'
      };
      var body = json.encode({
        "uuid": DateTime.now().toIso8601String(),
        "relationId": relationId,
        "firstName": firstName,
        "middleName": '',
        "lastName": lastName.isEmpty ? null : lastName,
        "fullName": firstName,
        "gender": gender,
        "birthDetails": {
          "dobYear": birthDetails.dobYear,
          "dobMonth": birthDetails.dobMonth,
          "dobDay": birthDetails.dobDay,
          "tobHour": birthDetails.tobHour,
          "meridiem": birthDetails.meridiem,
          "tobMin": birthDetails.tobMin
        },
        "birthPlace": {
          "placeName": birthPlace.placeName,
          "placeId": birthPlace.placeId,
        }
      });

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['message'];
        print(data);
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
