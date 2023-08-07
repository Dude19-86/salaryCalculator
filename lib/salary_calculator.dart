import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salary_calculator/bloc/main/main_bloc.dart';

class SalaryCalculator extends StatefulWidget {
  const SalaryCalculator({super.key});

  @override
  State<SalaryCalculator> createState() => _SalaryCalculatorState();
}

class _SalaryCalculatorState extends State<SalaryCalculator> {
  //#region Variables
  int dayCounter = 0;
  int nightCounter = 0;
  int partCounter = 0;
  double dayAmount = 0;
  double nightAmount = 0;
  double partAmount = 0;
  double summary = 0;
  double dayPercent = 50;
  double nightPercent = 20;
  double premiumPercent = 12;
  double partJobPercent = 20;

  //#endregion

  //#region  myControllers
  final myControllerDay = TextEditingController();
  final myControllerNight = TextEditingController();
  final myControllerPart = TextEditingController();
  final myControllerDayPercent = TextEditingController();
  final myControllerNightPercent = TextEditingController();
  final myControllerPremiumPercent = TextEditingController();
  final myControllerPartJobPercent = TextEditingController();

  //#endregion

  //#region Methods
  void _dayAmountCounter() {
    setState(() {
      dayAmount += double.parse(myControllerDay.text);
      dayCounter++;
    });
  }

  void _nightAmountCounter() {
    setState(() {
      nightAmount += double.parse(myControllerNight.text);
      nightCounter++;
    });
  }

  void _partAmountCounter() {
    setState(() {
      partAmount += double.parse(myControllerPart.text);
      partCounter++;
    });
  }

  void _percentDay() {
    setState(() {
      dayPercent = double.parse(myControllerDayPercent.text);
    });
  }

  void _percentNight() {
    setState(() {
      nightPercent = double.parse(myControllerNightPercent.text);
    });
  }

  void _percentPremium() {
    setState(() {
      premiumPercent = double.parse(myControllerPremiumPercent.text);
    });
  }

  void _percentPartJob() {
    setState(() {
      partJobPercent = double.parse(myControllerPartJobPercent.text);
    });
  }

  void _default() {
    setState(() {
      dayCounter = 0;
      nightCounter = 0;
      partCounter = 0;
      dayAmount = 0;
      nightAmount = 0;
      partAmount = 0;
      summary = 0;
      dayPercent = 50;
      nightPercent = 20;
      premiumPercent = 12;
      partJobPercent = 20;
      myControllerDay.text = '';
      myControllerNight.text = '';
      myControllerPart.text = '';
      myControllerDayPercent.text = '';
      myControllerNightPercent.text = '';
      myControllerPremiumPercent.text = '';
      myControllerPartJobPercent.text = '';
    });
  }

  void _summaryF() {
    setState(() {
      summary = ((dayAmount +
                  (dayAmount * ((dayPercent + premiumPercent) / 100))) +
              (nightAmount +
                  (nightAmount *
                      ((dayPercent + nightPercent + premiumPercent) / 100))) +
              (partAmount +
                  (partAmount * ((dayPercent + partJobPercent) / 100))))
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
                              child: Text(dayCounter.toString()),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                width: 100,
                                height: 30,
                                child: TextField(
                                  controller: myControllerDay,
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
                              child: Text(dayAmount.toString()),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              child: Text(nightCounter.toString()),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                width: 100,
                                height: 30,
                                child: TextField(
                                  controller: myControllerNight,
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
                              child: Text(nightAmount.toString()),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              child: Text(partCounter.toString()),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: SizedBox(
                                width: 100,
                                height: 30,
                                child: TextField(
                                  controller: myControllerPart,
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
                              child: Text(partAmount.toString()),
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
                                Text(('Summary: ${summary.toString()}')),
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
                                      controller: myControllerDayPercent,
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
                                  child: Text(dayPercent.toString()),
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
                                      controller: myControllerNightPercent,
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
                                  child: Text(nightPercent.toString()),
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
                                      controller: myControllerPremiumPercent,
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
                                  child: Text(premiumPercent.toString()),
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
                                      controller: myControllerPartJobPercent,
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
                                  child: Text(partJobPercent.toString()),
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
