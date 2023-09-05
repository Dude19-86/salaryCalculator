part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class MainInit extends MainEvent {}

@immutable
class MainUpdateCalculator extends MainEvent {
  MainUpdateCalculator(this.calculator);

  Calculator calculator;
}

class MainUpdateTheme extends MainEvent {
  MainUpdateTheme({required this.isDarkTheme});

  bool isDarkTheme;
}

class MainUpdateLanguage extends MainEvent {
  MainUpdateLanguage({required this.isLanguage});

  bool isLanguage;
}
