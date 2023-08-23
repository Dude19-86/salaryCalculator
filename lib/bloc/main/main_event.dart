part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class MainInit extends MainEvent {}

@immutable
class MainUpdateCalculator extends MainEvent {
  MainUpdateCalculator({required this.calculator});

  Calculator calculator;
}

class MainUpdateTheme extends MainEvent {
  MainUpdateTheme({required this.isDarkTheme});

  bool isDarkTheme;
}
