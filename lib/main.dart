import 'package:adv_basics/quiz.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const Quiz());
  final numbers = [5, 6];
  final myList = [1, 2];
  var list3 = [1, 3, ...numbers, ...myList, 8, 9];

  print(list3);
}
