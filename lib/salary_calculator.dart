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
  final myControllerDay = TextEditingController();
  final myControllerNight = TextEditingController();
  final myControllerPart = TextEditingController();
  final myControllerDayPercent = TextEditingController();
  final myControllerNightPercent = TextEditingController();
  final myControllerPremiumPercent = TextEditingController();
  final myControllerPartJobPercent = TextEditingController();

  //#region Methods
  @override
  void initState() {
    final mBloc = context.read<MainBloc>();
    super.initState();
    myControllerDay.text = mBloc.state.calculator!.inputDay;
  }

  // void _saveText() {
  //   // Save the text to the shared preference.
  //   final mBloc = context.read<MainBloc>();
  //   mBloc.state.calculator!.inputDay = myControllerDay.text;
  //   mBloc.add(MainUpdateCalculator(mBloc.state.calculator!));
  // }

  void _dayAmountCounter() {
    final mBloc = context.read<MainBloc>();
    mBloc.state.calculator!.dayAmount += double.parse(myControllerDay.text);
     // myControllerDay.text = mBloc.state.calculator!.inputDay;
    mBloc.state.calculator!.dayCounter++;
    mBloc.add(MainUpdateCalculator(mBloc.state.calculator!));
  }

  void _nightAmountCounter() {
    final mBloc = context.read<MainBloc>();
    mBloc.state.calculator!.nightAmount += double.parse(myControllerNight.text);
    mBloc.state.calculator!.nightCounter++;
    mBloc.add(MainUpdateCalculator(mBloc.state.calculator!));
  }

  void _partAmountCounter() {
    final mBloc = context.read<MainBloc>();
    mBloc.state.calculator!.partAmount += double.parse(myControllerPart.text);
    mBloc.state.calculator!.partCounter++;
    mBloc.add(MainUpdateCalculator(mBloc.state.calculator!));
  }

  void _percentDay() async {
    final mBloc = context.read<MainBloc>();
    mBloc.state.calculator!.dayPercent =
        double.parse(myControllerDayPercent.text);
    mBloc.add(MainUpdateCalculator(mBloc.state.calculator!));
  }

  void _percentNight() {
    final mBloc = context.read<MainBloc>();
    mBloc.state.calculator!.nightPercent =
        double.parse(myControllerNightPercent.text);
    mBloc.add(MainUpdateCalculator(mBloc.state.calculator!));
  }

  void _percentPremium() {
    final mBloc = context.read<MainBloc>();
    mBloc.state.calculator!.premiumPercent =
        double.parse(myControllerPremiumPercent.text);
    mBloc.add(MainUpdateCalculator(mBloc.state.calculator!));
  }

  void _percentPartJob() {
    final mBloc = context.read<MainBloc>();
    mBloc.state.calculator!.partJobPercent =
        double.parse(myControllerPartJobPercent.text);
    mBloc.add(MainUpdateCalculator(mBloc.state.calculator!));
  }

  void _default() {
    final mBloc = context.read<MainBloc>();

    mBloc.state.calculator!.dayCounter = 0;
    mBloc.state.calculator!.nightCounter = 0;
    mBloc.state.calculator!.partCounter = 0;
    mBloc.state.calculator!.dayAmount = 0;
    mBloc.state.calculator!.nightAmount = 0;
    mBloc.state.calculator!.partAmount = 0;
    mBloc.state.calculator!.summary = 0;
    mBloc.state.calculator!.dayPercent = 50;
    mBloc.state.calculator!.nightPercent = 20;
    mBloc.state.calculator!.premiumPercent = 12;
    mBloc.state.calculator!.partJobPercent = 20;
    myControllerDay.text = mBloc.state.calculator!.inputDay;
    myControllerNight.text = '';
    myControllerPart.text = '';
    myControllerDayPercent.text = '';
    myControllerNightPercent.text = '';
    myControllerPremiumPercent.text = '';
    myControllerPartJobPercent.text = '';
    mBloc.add(MainUpdateCalculator(mBloc.state.calculator!));
  }

  void _summaryF() {
    final mBloc = context.read<MainBloc>();

    //Не буду усложнять, но мы получаем объект класса калькулятор из нашего хранилища блока
    Calculator calculator = mBloc.state.calculator!;

    calculator.summary = ((calculator.dayAmount +
        (calculator.dayAmount *
            ((calculator.dayPercent + calculator.premiumPercent) /
                100))) +
        (calculator.nightAmount +
            (calculator.nightAmount *
                ((calculator.dayPercent +
                    calculator.nightPercent +
                    calculator.premiumPercent) /
                    100))) +
        (calculator.partAmount +
            (calculator.partAmount *
                ((calculator.dayPercent + calculator.partJobPercent) /
                    100))))
        .roundToDouble();

    mBloc.add(MainUpdateCalculator(mBloc.state.calculator!));
  }

  //#endregion

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Container(
          child: state.isLoadingFirstData
              ? const Stack(
            children: [
              Positioned.fill(
                  child: Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator()))
            ],
          )
              : SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        final opBloc = context.read<MainBloc>();
                        opBloc.add(MainUpdateTheme(
                            isDarkTheme: !state.isDarkTheme));
                      },
                      child: Text(state.isDarkTheme
                          ? 'Dark theme'
                          : 'Light theme')),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  child: Text(state.calculator == null
                                      ? ""
                                      : state.calculator!.dayCounter
                                      .toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: 100,
                                    height: 30,
                                    child: TextField(
                                      onChanged: (value) {
                                        //Пример, тут можно записать значение при изменении
                                        state.calculator!.inputDay = value;
                                        myControllerDay.text = value;
                                        context.read<MainBloc>().add(
                                            MainUpdateCalculator(
                                                state.calculator!));
                                        print(state.calculator!.inputDay);
                                        print(value);
                                      },
                                      keyboardType: TextInputType.number,
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
                                  child: const Icon(Icons.add,
                                      color: Colors.indigo),
                                ),
                                SizedBox(
                                  child: Text(state.calculator == null
                                      ? ""
                                      : state.calculator!.dayAmount
                                      .toString()),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  child: Text(state.calculator == null
                                      ? ""
                                      : state.calculator!.nightCounter
                                      .toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: 100,
                                    height: 30,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: myControllerNight,
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
                                  child: const Icon(Icons.add,
                                      color: Colors.indigo),
                                ),
                                SizedBox(
                                  child: Text(state.calculator == null
                                      ? ""
                                      : state.calculator!.nightAmount
                                      .toString()),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  child: Text(state.calculator == null
                                      ? ""
                                      : state.calculator!.partCounter
                                      .toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: 100,
                                    height: 30,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
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
                                  child: const Icon(Icons.add,
                                      color: Colors.indigo),
                                ),
                                SizedBox(
                                  child: Text(state.calculator == null
                                      ? ""
                                      : state.calculator!.partAmount
                                      .toString()),
                                ),
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     const SizedBox(
                            //       child: Text('0'),
                            //     ),
                            //     const Padding(
                            //       padding: EdgeInsets.all(10),
                            //       child: SizedBox(
                            //         width: 100,
                            //         height: 30,
                            //         child: TextField(
                            //           // controller: this.controller,
                            //           obscureText: false,
                            //           decoration: InputDecoration(
                            //             border: OutlineInputBorder(),
                            //             labelText: 'Day Hours',
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     TextButton(
                            //       onPressed: () {},
                            //       child: const Icon(Icons.add,
                            //           color: Colors.indigo),
                            //     ),
                            //     const SizedBox(
                            //       child: Text('Amount'),
                            //     ),
                            //   ],
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: SizedBox(
                                child: Row(
                                  children: [
                                    Text(
                                        ('Summary: ${state.calculator == null
                                            ? ""
                                            : state.calculator!.summary
                                            .toString()}')),
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
                          builder: (context) =>
                              AlertDialog(
                                title: const Text(
                                  'My Text',
                                ),
                                content: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: SizedBox(
                                              height: 30,
                                              child: TextField(
                                                keyboardType:
                                                TextInputType.number,
                                                controller:
                                                myControllerDayPercent,
                                                obscureText: false,
                                                decoration:
                                                const InputDecoration(
                                                  border:
                                                  OutlineInputBorder(),
                                                  labelText: 'Day Percent',
                                                ),
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
                                          child: Text(state.calculator == null
                                              ? ""
                                              : state.calculator!.dayPercent
                                              .toString()),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: SizedBox(
                                              width: 150,
                                              height: 30,
                                              child: TextField(
                                                keyboardType:
                                                TextInputType.number,
                                                controller:
                                                myControllerNightPercent,
                                                obscureText: false,
                                                decoration:
                                                const InputDecoration(
                                                  border:
                                                  OutlineInputBorder(),
                                                  labelText: 'Night Percent',
                                                ),
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
                                          child: Text(state.calculator == null
                                              ? ""
                                              : state.calculator!.nightPercent
                                              .toString()),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: SizedBox(
                                              width: 150,
                                              height: 30,
                                              child: TextField(
                                                keyboardType:
                                                TextInputType.number,
                                                controller:
                                                myControllerPremiumPercent,
                                                obscureText: false,
                                                decoration:
                                                const InputDecoration(
                                                  border:
                                                  OutlineInputBorder(),
                                                  labelText:
                                                  'Premium Percent',
                                                ),
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
                                          child: Text(state.calculator == null
                                              ? ""
                                              : state
                                              .calculator!.premiumPercent
                                              .toString()),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: SizedBox(
                                              width: 150,
                                              height: 30,
                                              child: TextField(
                                                keyboardType:
                                                TextInputType.number,
                                                controller:
                                                myControllerPartJobPercent,
                                                obscureText: false,
                                                decoration:
                                                const InputDecoration(
                                                  border:
                                                  OutlineInputBorder(),
                                                  labelText:
                                                  'Part-Job Percent',
                                                ),
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
                                          child: Text(state.calculator == null
                                              ? ""
                                              : state
                                              .calculator!.partJobPercent
                                              .toString()),
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
                  ElevatedButton(
                      onPressed: _default, child: const Text('Default')),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
