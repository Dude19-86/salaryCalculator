import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salary_calculator/bloc/main/main_bloc.dart';
import 'package:salary_calculator/models/calculator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SalaryCalculator extends StatefulWidget {
  const SalaryCalculator({super.key});

  @override
  State<SalaryCalculator> createState() => _SalaryCalculatorState();
}

class _SalaryCalculatorState extends State<SalaryCalculator> {
  var calculator = Calculator();

  //#region Methods
  void _dayAmountCounter() {
    setState(() {
      calculator.dayAmount += double.parse(calculator.myControllerDay.text);
      calculator.dayCounter++;
    });
  }

  void _nightAmountCounter() {
    setState(() {
      calculator.nightAmount += double.parse(calculator.myControllerNight.text);
      calculator.nightCounter++;
    });
  }

  void _partAmountCounter() {
    setState(() {
      calculator.partAmount += double.parse(calculator.myControllerPart.text);
      calculator.partCounter++;
    });
  }

  @override
  void initState() {
    _initPercentDay();
    super.initState();
  }

  Future _initPercentDay() async {
    calculator.dayPercent = await _getCounter();
  }

  static const percentDayKey = 'percentDayKey';

  void _percentDay() async {
    setState(() {
      calculator.dayPercent = double.parse(calculator.myControllerDayPercent.text);
    });
    await _setCounter();
  }

  Future _setCounter() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setDouble(percentDayKey, calculator.dayPercent);
  }

  Future<double> _getCounter() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(percentDayKey) ?? 0;
  }

  void _percentNight() {
    setState(() {
      calculator.nightPercent = double.parse(calculator.myControllerNightPercent.text);
    });

      final opBloc = context.read<MainBloc>();
      opBloc.add(MainUpdateCalculator(calculator));
  }

  void _percentPremium() {
    setState(() {
      calculator.premiumPercent = double.parse(calculator.myControllerPremiumPercent.text);
    });
  }

  void _percentPartJob() {
    setState(() {
      calculator.partJobPercent = double.parse(calculator.myControllerPartJobPercent.text);
    });
  }

  void _default() {
    setState(() {
      calculator.dayCounter = 0;
      calculator.nightCounter = 0;
      calculator.partCounter = 0;
      calculator.dayAmount = 0;
      calculator.nightAmount = 0;
      calculator.partAmount = 0;
      calculator.summary = 0;
      calculator.dayPercent = 50;
      calculator.nightPercent = 20;
      calculator.premiumPercent = 12;
      calculator.partJobPercent = 20;
      calculator.myControllerDay.text = '';
      calculator.myControllerNight.text = '';
      calculator.myControllerPart.text = '';
      calculator.myControllerDayPercent.text = '';
      calculator.myControllerNightPercent.text = '';
      calculator.myControllerPremiumPercent.text = '';
      calculator.myControllerPartJobPercent.text = '';
    });
  }

  void _summaryF() {
    setState(() {
      calculator.summary = ((calculator.dayAmount +
                  (calculator.dayAmount * ((calculator.dayPercent + calculator.premiumPercent) / 100))) +
              (calculator.nightAmount +
                  (calculator.nightAmount *
                      ((calculator.dayPercent + calculator.nightPercent + calculator.premiumPercent) / 100))) +
              (calculator.partAmount +
                  (calculator.partAmount * ((calculator.dayPercent + calculator.partJobPercent) / 100))))
          .roundToDouble();
    });
  }

  //#endregion

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    final opBloc = context.read<MainBloc>();
                    opBloc
                        .add(MainUpdateTheme(isDarkTheme: !state.isDarkTheme));
                  },
                  child:
                      Text(state.isDarkTheme ? 'Dark theme' : 'Light theme')),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              child: Text(calculator.dayCounter.toString()),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                width: 100,
                                height: 30,
                                child: TextField(
                                  controller: calculator.myControllerDay,
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Day Hours',
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: _dayAmountCounter,
                              child:
                                  const Icon(Icons.add, color: Colors.indigo),
                            ),
                            SizedBox(
                              child: Text(calculator.dayAmount.toString()),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              child: Text(calculator.nightCounter.toString()),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                width: 100,
                                height: 30,
                                child: TextField(
                                  controller: calculator.myControllerNight,
                                  // controller: this.controller,
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Night Hours',
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: _nightAmountCounter,
                              child:
                                  const Icon(Icons.add, color: Colors.indigo),
                            ),
                            SizedBox(
                              child: Text(calculator.nightAmount.toString()),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              child: Text(calculator.partCounter.toString()),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                width: 100,
                                height: 30,
                                child: TextField(
                                  controller: calculator.myControllerPart,
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Part Time Job',
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: _partAmountCounter,
                              child:
                                  const Icon(Icons.add, color: Colors.indigo),
                            ),
                            SizedBox(
                              child: Text(calculator.partAmount.toString()),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              child: Text('0'),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                width: 100,
                                height: 30,
                                child: TextField(
                                  // controller: this.controller,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Day Hours',
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child:
                                  const Icon(Icons.add, color: Colors.indigo),
                            ),
                            const SizedBox(
                              child: Text('Amount'),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: SizedBox(
                            child: Row(
                              children: [
                                Text(('Summary: ${calculator.summary.toString()}')),
                                TextButton(
                                  onPressed: _summaryF,
                                  child: const Icon(Icons.add,
                                      color: Colors.indigo),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'My Text',
                        ),
                        content: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: 150,
                                    height: 30,
                                    child: TextField(
                                      controller: calculator.myControllerDayPercent,
                                      obscureText: false,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Day Percent',
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: _percentDay,
                                  child: const Icon(Icons.add,
                                      color: Colors.indigo),
                                ),
                                SizedBox(
                                  child: Text(calculator.dayPercent.toString()),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: 150,
                                    height: 30,
                                    child: TextField(
                                      controller: calculator.myControllerNightPercent,
                                      obscureText: false,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Night Percent',
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                   onPressed: _percentNight,
                                  child: const Icon(Icons.add,
                                      color: Colors.indigo),
                                ),
                                SizedBox(
                                  child:
                                      Text(calculator.nightPercent.toString()),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: 150,
                                    height: 30,
                                    child: TextField(
                                      controller: calculator.myControllerPremiumPercent,
                                      obscureText: false,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Premium Percent',
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: _percentPremium,
                                  child: const Icon(Icons.add,
                                      color: Colors.indigo),
                                ),
                                SizedBox(
                                  child: Text(calculator.premiumPercent.toString()),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: 150,
                                    height: 30,
                                    child: TextField(
                                      controller: calculator.myControllerPartJobPercent,
                                      obscureText: false,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Part-Job Percent',
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: _percentPartJob,
                                  child: const Icon(Icons.add,
                                      color: Colors.indigo),
                                ),
                                SizedBox(
                                  child: Text(calculator.partJobPercent.toString()),
                                ),
                              ],
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            child: const Text('CANCEL'),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: const Text('Ok'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('Settings'),
                ),
              ),
              ElevatedButton(onPressed: _default, child: const Text('Default')),
            ],
          ),
        );
      },
    );
  }
}
