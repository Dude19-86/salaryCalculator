part of 'main_bloc.dart';

class MainState {
  const MainState({
    this.isLoadingFirstData = true,
    this.calculator,
    this.isDarkTheme = false,
    this.isLanguage = true,
  });

  final bool isLoadingFirstData;
  final Calculator? calculator;
  final bool isDarkTheme;
  final bool isLanguage;

  MainState copyWith({
    bool? isLoadingFirstData,
    Calculator? calculator,
    bool? isDarkTheme,
    bool? isLanguage,
  }) {
    return MainState(
      isLoadingFirstData: isLoadingFirstData ?? this.isLoadingFirstData,
      calculator: calculator ?? this.calculator,
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      isLanguage: isLanguage ?? this.isLanguage,
    );
  }
}
