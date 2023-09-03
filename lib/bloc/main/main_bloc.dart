import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:salary_calculator/constants/common_constants.dart';
import 'package:salary_calculator/models/calculator.dart';
part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<MainInit>((event, emit) async {
      //Тут первая иницилизация
      //Можно сделать получение данных из хранилища, например Hive, или SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();

      bool isDarkTheme =
          prefs.getBool(CommonConstants.SharedPreferencesIsDarkTheme) ?? false;

      //получаем строку
      String? tmpCalculator =
          prefs.getString(CommonConstants.SharedPreferencesCalculator);
      //Проверяем записано ли что-то, если да, то пробуем её расджейсонить
      Calculator calculator = Calculator();
      //try catch потому что может возникнуть исключение при попытке расджейсонить
      try {
        calculator = tmpCalculator != "" && tmpCalculator != null
            ? Calculator.fromJson(jsonDecode(tmpCalculator))
            : calculator;
      } catch (ex) {
        print("ex");
      }

      emit(state.copyWith(
          isLoadingFirstData: false,
          isDarkTheme: isDarkTheme,
          calculator: calculator));
    });

    on<MainUpdateCalculator>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //Записываем наш объект калькулятор в формате json в строку
      await prefs.setString(CommonConstants.SharedPreferencesCalculator,
          jsonEncode(event.calculator));
      emit(state.copyWith(calculator: event.calculator));
    });

    on<MainUpdateTheme>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setBool(
          CommonConstants.SharedPreferencesIsDarkTheme, event.isDarkTheme);

      emit(state.copyWith(isDarkTheme: event.isDarkTheme));
    });
  }
}
