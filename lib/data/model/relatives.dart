// To parse this JSON data, do
//
//     final relatives = relativesFromJson(jsonString);

import 'dart:convert';

Relatives relativesFromJson(String str) => Relatives.fromJson(json.decode(str));

String relativesToJson(Relatives data) => json.encode(data.toJson());

class Relatives {
  Relatives({
    required this.httpStatus,
    required this.httpStatusCode,
    required this.success,
    required this.message,
    required this.data,
  });

  String httpStatus;
  int httpStatusCode;
  bool success;
  String message;
  AllRelativeData data;

  factory Relatives.fromJson(Map<String, dynamic> json) => Relatives(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        data: AllRelativeData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class AllRelativeData {
  AllRelativeData({
    required this.allRelatives,
  });

  List<AllRelative> allRelatives;

  factory AllRelativeData.fromJson(Map<String, dynamic> json) =>
      AllRelativeData(
        allRelatives: List<AllRelative>.from(
            json["allRelatives"].map((x) => AllRelative.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "allRelatives": List<dynamic>.from(allRelatives.map((x) => x.toJson())),
      };
}

class AllRelative {
  AllRelative({
    required this.uuid,
    required this.relationId,
    required this.relation,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.fullName,
    required this.gender,
    required this.dateAndTimeOfBirth,
    required this.birthDetails,
    required this.birthPlace,
  });

  String uuid;
  int relationId;
  String relation;
  String firstName;
  dynamic middleName;
  String lastName;
  String fullName;
  String gender;
  DateTime dateAndTimeOfBirth;
  BirthDetails birthDetails;
  BirthPlace birthPlace;

  factory AllRelative.fromJson(Map<String, dynamic> json) => AllRelative(
        uuid: json["uuid"],
        relationId: json["relationId"],
        relation: json["relation"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        gender: json["gender"],
        dateAndTimeOfBirth: DateTime.parse(json["dateAndTimeOfBirth"]),
        birthDetails: BirthDetails.fromJson(json["birthDetails"]),
        birthPlace: BirthPlace.fromJson(json["birthPlace"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "relationId": relationId,
        "relation": relation,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "fullName": fullName,
        "gender": gender,
        "dateAndTimeOfBirth": dateAndTimeOfBirth.toIso8601String(),
        "birthDetails": birthDetails.toJson(),
        "birthPlace": birthPlace.toJson(),
      };
}

class BirthDetails {
  BirthDetails({
    required this.dobYear,
    required this.dobMonth,
    required this.dobDay,
    required this.tobHour,
    required this.meridiem,
    required this.tobMin,
  });

  int dobYear;
  int dobMonth;
  int dobDay;
  int tobHour;
  String meridiem;
  int tobMin;

  factory BirthDetails.fromJson(Map<String, dynamic> json) => BirthDetails(
        dobYear: json["dobYear"],
        dobMonth: json["dobMonth"],
        dobDay: json["dobDay"],
        tobHour: json["tobHour"],
        meridiem: json["meridiem"],
        tobMin: json["tobMin"],
      );

  Map<String, dynamic> toJson() => {
        "dobYear": dobYear,
        "dobMonth": dobMonth,
        "dobDay": dobDay,
        "tobHour": tobHour,
        "meridiem": meridiem,
        "tobMin": tobMin,
      };
}

class BirthPlace {
  BirthPlace({
    required this.placeName,
    required this.placeId,
  });

  String placeName;
  String placeId;

  factory BirthPlace.fromJson(Map<String, dynamic> json) => BirthPlace(
        placeName: json["placeName"],
        placeId: json["placeId"],
      );

  Map<String, dynamic> toJson() => {
        "placeName": placeName,
        "placeId": placeId,
      };
}
