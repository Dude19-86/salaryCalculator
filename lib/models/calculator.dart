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
  final myControllerDay = TextEditingController();
  final myControllerNight = TextEditingController();
  final myControllerPart = TextEditingController();
  final myControllerDayPercent = TextEditingController();
  final myControllerNightPercent = TextEditingController();
  final myControllerPremiumPercent = TextEditingController();
  final myControllerPartJobPercent = TextEditingController();
  static String dayPercentKey = 'dayPercent';
  static String nightPercentKey = 'nightPercent';
  static String premiumPercentKey = 'premiumPercent';
  static String partJobPercentKey = 'partJobPercent';
}
