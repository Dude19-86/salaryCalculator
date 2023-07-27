import 'package:flutter/material.dart';

class SalaryCalculator extends StatefulWidget {
  const SalaryCalculator({super.key});

  @override
  State<SalaryCalculator> createState() => _SalaryCalculatorState();
}

class _SalaryCalculatorState extends State<SalaryCalculator> {
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
                            labelText: 'Night Hours',
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
                            labelText: 'Part Time Job',
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
                const Padding(
                  padding: EdgeInsets.all(50),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Text(('Summary: ')),
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
