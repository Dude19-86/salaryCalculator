import 'package:flutter/material.dart';

class SalaryCalculator extends StatefulWidget {
  const SalaryCalculator({super.key});

  @override
  State<SalaryCalculator> createState() => _SalaryCalculatorState();
}

class _SalaryCalculatorState extends State<SalaryCalculator> {
  int dayCounter = 0;
  int nightCounter = 0;
  int partCounter = 0;
  double dayAmount = 0;
  double nightAmount = 0;
  double partAmount = 0;
  double summary = 0;


  final myControllerDay = TextEditingController();
  final myControllerNight = TextEditingController();
  final myControllerPart = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   // Start listening to changes.
  //   myControllerDay.addListener(_dayAmountCounter);
  //   myControllerDay.addListener(_nightAmountCounter);
  //   myControllerDay.addListener(_partAmountCounter);
  // }
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is removed from the widget tree.
  //   // This also removes the _printLatestValue listener.
  //   myControllerDay.dispose();
  //   myControllerNight.dispose();
  //   myControllerPart.dispose();
  //   super.dispose();
  // }

  // void _printLatestValue() {
  //   print('Second text field: ${myControllerDay.text}');
  // }

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

  void _summaryF() {
    setState(() {
      summary = (dayAmount + (dayAmount * 0.1)) + (nightAmount + (nightAmount * 0.2)) + (partAmount + (partAmount * 0.3));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
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
                      child: const Icon(Icons.add, color: Colors.indigo),
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Night Hours',
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: _nightAmountCounter,
                      child: const Icon(Icons.add, color: Colors.indigo),
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Part Time Job',
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: _partAmountCounter,
                      child: const Icon(Icons.add, color: Colors.indigo),
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
                      child: const Icon(Icons.add, color: Colors.indigo),
                    ),
                    const SizedBox(
                      child: Text('Amount'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Text(('Summary: ${summary.toString()}')),
                        TextButton(onPressed: _summaryF, child: const Icon(Icons.add, color: Colors.indigo),
    )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
