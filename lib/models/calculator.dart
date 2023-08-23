class Calculator {
  Calculator({
    // required this.param1,
    // this.param2 = 0,
    // this.param3,
    this.dayPercent = 50,
    this.nightPercent = 20,
    this.premiumPercent = 12,
    this.partJobPercent = 20,
  });

  // double param1; //обязательный параметр
  // double param2; //Необязательный с значением по умолчанию
  // double? param3; //необязательный с значением по умолчанию = null
  double dayPercent;
  double nightPercent;
  double premiumPercent;
  double partJobPercent;
  static String dayPercentKey = 'dayPercent';
  static String nightPercentKey = 'nightPercent';
  static String premiumPercentKey = 'premiumPercent';
  static String partJobPercentKey = 'partJobPercent';
}
