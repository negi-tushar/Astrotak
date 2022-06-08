import 'dart:convert';

import 'package:astrotak/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteRelativesData {
  void deleteRelativesData(BuildContext context, String uuid) async {
    try {
      var headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVHlwZSI6IkFHRU5UIiwidXVpZCI6ImIyYWViYjMwLThmM2YtMTFlYy05Y2I2LWY3ZTNmNjY2YTIyMyIsImlzRW1haWxWZXJpZmllZCI6dHJ1ZSwicGhvbmVOdW1iZXIiOiI5NzExMTgxMTk4IiwiZW1haWwiOiJyYWtlc2hzaGFybWEuamFpQGdtYWlsLmNvbSIsIm1hc2tlZEVtYWlsIjoicmFrKioqKioqKioqKioqKmdtYWlsLmNvbSIsImV4aXN0aW5nVXNlciI6ZmFsc2UsImlhdCI6MTY0Nzk0NTA0MSwiZXhwIjoxNjY3OTQ1MDQxfQ.Ng9sm0iJbY7_8BALAq31092He6gOIkmWUMw1dwzsg2E'
      };
      var response = await http.post(
        Uri.parse('https://staging-api.astrotak.com/api/relative/delete/$uuid'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        showSnackbar(
            context: context,
            content: data['message'],
            color: Colors.green.shade500);
      } else {
        showSnackbar(
            context: context,
            content: "Something went wrong",
            color: Colors.red.shade500);

        throw Exception('Failed');
      }
    } catch (e) {
      showSnackbar(
          context: context,
          content: "Something went wrong",
          color: Colors.red.shade500);
    }
  }
}
