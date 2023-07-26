import 'package:flutter/material.dart';
import 'package:salary_calculator/text_field_salary_calculator.dart';


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
      child: const Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldSalary(),
                TextFieldSalary(),
                TextFieldSalary(),
                TextFieldSalary(),
                Padding(
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
