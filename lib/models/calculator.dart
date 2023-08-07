class Calculator {
  Calculator({required this.param1, this.param2 = 0, this.param3});

  double param1; //обязательный параметр
  double param2; //Необязательный с значением по умолчанию
  double? param3; //необязательный с значением по умолчанию = null
}
