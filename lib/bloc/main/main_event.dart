part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class MainInit extends MainEvent {}

class MainUpdateCalculator extends MainEvent {
  MainUpdateCalculator(this.calculator);

  Calculator calculator;
}

class MainUpdateTheme extends MainEvent {
  MainUpdateTheme({required this.isDarkTheme});

  bool isDarkTheme;
}
