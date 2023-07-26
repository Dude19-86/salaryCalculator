import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layot demo'),
        ),
        body: ListView(
          children: const [
            // ImageSection(),
            // TitleSection(),
            // TapBoxButtonSection(),
            // TapBoxCTextSection(),
            // TapBoxA(),
            // ParentWidget(),
            SalaryCalculator(),
          ],
        ),
      ),
    );
  }
}
