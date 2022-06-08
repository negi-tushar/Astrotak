// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:astrotak/constants/constants.dart';
import 'package:astrotak/data/model/relatives.dart';
import 'package:astrotak/provider/relatives_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class FetchRelativesData {
  void getRelativesData(BuildContext context) async {
    try {
      var headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVHlwZSI6IkFHRU5UIiwidXVpZCI6ImIyYWViYjMwLThmM2YtMTFlYy05Y2I2LWY3ZTNmNjY2YTIyMyIsImlzRW1haWxWZXJpZmllZCI6dHJ1ZSwicGhvbmVOdW1iZXIiOiI5NzExMTgxMTk4IiwiZW1haWwiOiJyYWtlc2hzaGFybWEuamFpQGdtYWlsLmNvbSIsIm1hc2tlZEVtYWlsIjoicmFrKioqKioqKioqKioqKmdtYWlsLmNvbSIsImV4aXN0aW5nVXNlciI6ZmFsc2UsImlhdCI6MTY0Nzk0NTA0MSwiZXhwIjoxNjY3OTQ1MDQxfQ.Ng9sm0iJbY7_8BALAq31092He6gOIkmWUMw1dwzsg2E'
      };
      var response = await http.get(
        Uri.parse('https://staging-api.astrotak.com/api/relative/all'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        var relativesData = AllRelativeData.fromJson(data['data']);
        Provider.of<RelativesProvider>(context, listen: false)
            .setRelativesData(relativesData);
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
