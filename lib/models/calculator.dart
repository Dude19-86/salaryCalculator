import 'package:flutter/material.dart';

class Calculator {
  Calculator({
    this.dayPercent = 50,
    this.nightPercent = 20,
    this.premiumPercent = 12,
    this.partJobPercent = 20,
  });

  // double param1; //обязательный параметр
  // double param2; //Необязательный с значением по умолчанию
  // double? param3; //необязательный с значением по умолчанию = null
  int dayCounter = 0;
  int nightCounter = 0;
  int partCounter = 0;
  double dayAmount = 0;
  double nightAmount = 0;
  double partAmount = 0;
  double summary = 0;
  double dayPercent;
  double nightPercent;
  double premiumPercent;
  double partJobPercent;

  String inputDay = '';
  String inputNight = '';
  String inputPart = '';
  String inputDayPercent = '';
  String inputNightPercent = '';
  String inputPremiumPercent = '';
  String inputPartJobPercent = '';


  //Это нужно, чтобы перевести в json
  Map<String, dynamic> toJson() => {
        "dayPercent": dayPercent,
        "nightPercent": nightPercent,
        "premiumPercent": premiumPercent,
        "partJobPercent": partJobPercent,
        "dayCounter": dayCounter,
        "nightCounter": nightCounter,
        "partCounter": partCounter,
        "dayAmount": dayAmount,
        "nightAmount": nightAmount,
        "partAmount": partAmount,
        "summary": summary,
        "inputDay": inputDay,
        "inputNight": inputNight,
        "inputPart": inputPart,
        "inputDayPercent": inputDayPercent,
        "inputNightPercent": inputNightPercent,
        "inputPremiumPercent": inputPremiumPercent,
        "inputPartJobPercent": inputPartJobPercent,
      };

  //Это нужно, чтобы перевести из json в обычный формат
  Calculator.fromJson(Map<String, dynamic> json)
      : dayPercent = json["dayPercent"] ?? 0,
        nightPercent = json['nightPercent'] ?? 0,
        premiumPercent = json['premiumPercent'] ?? 0,
        partJobPercent = json['partJobPercent'] ?? 0,
        dayCounter = json["dayCounter"] ?? 0,
        nightCounter = json["nightCounter"] ?? 0,
        partCounter = json["partCounter"] ?? 0,
        dayAmount = json["dayAmount"] ?? 0,
        nightAmount = json["nightAmount"] ?? 0,
        partAmount = json["partAmount"] ?? 0,
        summary = json["summary"] ?? 0,
        inputDay = json["inputDay"] ?? '',
        inputNight = json["inputNight"] ?? '',
        inputPart = json["inputPart"] ?? '',
        inputDayPercent = json["inputDayPercent"] ?? '',
        inputNightPercent = json["inputNightPercent"] ?? '',
        inputPremiumPercent = json["inputPremiumPercent"] ?? '',
        inputPartJobPercent = json["inputPartJobPercent"] ?? '';

// static String dayPercentKey = 'dayPercent';
// static String nightPercentKey = 'nightPercent';
// static String premiumPercentKey = 'premiumPercent';
// static String partJobPercentKey = 'partJobPercent';
}
