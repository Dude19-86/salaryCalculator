part of 'main_bloc.dart';

class MainState {
  const MainState({
    this.calculator,
    this.isDarkTheme = false,
  });

  final Calculator? calculator;
  final bool isDarkTheme;

  MainState copyWith({
    Calculator? calculator,
    bool? isDarkTheme,
  }) {
    return MainState(
      calculator: calculator ?? this.calculator,
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
    );
  }
}
