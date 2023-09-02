import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salary_calculator/bloc/main/main_bloc.dart';
import 'package:salary_calculator/models/calculator.dart';
import 'package:salary_calculator/text_field_my.dart';
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
    super.initState();
  }

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
    myControllerDay.text = '';
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
    return BlocConsumer<MainBloc, MainState>(
      listenWhen: (previous, current) {
        // return true/false to determine whether or not
        // to invoke listener with state

        return previous.isLoadingFirstData && !current.isLoadingFirstData;
      },
      listener: (context, state) {
        myControllerDay.text = state.calculator!.inputDay;
        myControllerNight.text = state.calculator!.inputNight;
        myControllerPart.text = state.calculator!.inputPart;
        myControllerDayPercent.text = state.calculator!.inputDayPercent;
        myControllerNightPercent.text = state.calculator!.inputNightPercent;
        myControllerPremiumPercent.text = state.calculator!.inputPremiumPercent;
        myControllerPartJobPercent.text = state.calculator!.inputPartJobPercent;
      },
      builder: (context, state) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextFieldMy(
                                        input: 'inputDay',
                                        counter: state.calculator!.dayCounter,
                                        onPressed: _dayAmountCounter,
                                        controller: myControllerDay,
                                        amount: state.calculator!.dayAmount,
                                        labelText: 'Hours Day',
                                      ),
                                      TextFieldMy(
                                        input: 'inputNight',
                                        counter: state.calculator!.nightCounter,
                                        onPressed: _nightAmountCounter,
                                        controller: myControllerNight,
                                        amount: state.calculator!.nightAmount,
                                        labelText: 'Hours Night',
                                      ),
                                      TextFieldMy(
                                        input: 'inputPart',
                                        counter: state.calculator!.partCounter,
                                        onPressed: _partAmountCounter,
                                        controller: myControllerPart,
                                        amount: state.calculator!.partAmount,
                                        labelText: 'Hours Part',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(30),
                                        child: SizedBox(
                                          child: Row(
                                            children: [
                                              Text(
                                                  ('Summary: ${state.calculator == null ? "" : state.calculator!.summary.toString()}')),
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
                                          TextFieldMy(
                                              input: 'inputDayPercent',
                                              counter: 0,
                                              onPressed: _percentDay,
                                              controller:
                                                  myControllerDayPercent,
                                              amount:
                                                  state.calculator!.dayPercent,
                                              labelText: 'Day Percent'),
                                          TextFieldMy(
                                              input: 'inputNightPercent',
                                              counter: 0,
                                              onPressed: _percentNight,
                                              controller:
                                                  myControllerNightPercent,
                                              amount: state
                                                  .calculator!.nightPercent,
                                              labelText: 'Night Percent'),
                                          TextFieldMy(
                                              input: 'inputPremiumPercent',
                                              counter: 0,
                                              onPressed: _percentPremium,
                                              controller:
                                                  myControllerPremiumPercent,
                                              amount: state
                                                  .calculator!.premiumPercent,
                                              labelText: 'Premium Percent'),
                                          TextFieldMy(
                                              input: 'inputPartJobPercent',
                                              counter: 0,
                                              onPressed: _percentPartJob,
                                              controller:
                                                  myControllerPartJobPercent,
                                              amount: state
                                                  .calculator!.partJobPercent,
                                              labelText: 'Part-Job Percent'),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text('CANCEL'),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                        TextButton(
                                          child: const Text('Ok'),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('Settings'),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: _default,
                                child: const Text('Default')),
                          ],
                        ),
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
