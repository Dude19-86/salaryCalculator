import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salary_calculator/bloc/main/main_bloc.dart';
import 'package:salary_calculator/salary_calculator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => MainBloc()..add(MainInit()),
        ),
      ],
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Salary Calculator',
            theme: state.isDarkTheme
                ? ThemeData(
                    brightness: Brightness.dark,
                  )
                : ThemeData(
                    brightness: Brightness.light,
                  ),
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Salary Calculator'),
              ),
              body: const SalaryCalculator(),
            ),
          );
        },
      ),
    );
  }
}
