// import 'dart:async';

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

      emit(state.copyWith(
        isDarkTheme: isDarkTheme,
      ));
    });

    on<MainUpdateCalculator>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(Calculator.dayPercentKey, event.calculator.nightPercent);

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
