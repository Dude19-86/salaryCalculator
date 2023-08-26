part of 'main_bloc.dart';

class MainState {
  const MainState({
    this.isLoadingFirstData = true,
    this.calculator,
    this.isDarkTheme = false,
  });

  final bool isLoadingFirstData;
  final Calculator? calculator;
  final bool isDarkTheme;

  MainState copyWith({
    bool? isLoadingFirstData,
    Calculator? calculator,
    bool? isDarkTheme,
  }) {
    return MainState(
      isLoadingFirstData: isLoadingFirstData ?? this.isLoadingFirstData,
      calculator: calculator ?? this.calculator,
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
    );
  }
}
