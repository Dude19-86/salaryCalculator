import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/main/main_bloc.dart';

class TextFieldMy extends StatelessWidget {
  final String input;
  final int counter;
  final double amount;
  final String labelText;
  final Function() onPressed;
  final TextEditingController controller;

  const TextFieldMy({
    super.key,
    required this.input,
    required this.counter,
    required this.onPressed,
    required this.controller,
    required this.amount,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      return Row(
        children: [
          SizedBox(
            child: counter == 0
                ? null
                : Text(state.calculator == null ? "" : counter.toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 120,
              height: 30,
              child: TextField(
                onChanged: (value) {
                  if (input == "inputDay") {
                    state.calculator!.inputDay = value;
                  } else if (input == "inputNight") {
                    state.calculator!.inputNight = value;
                  } else if (input == "inputPart") {
                    state.calculator!.inputPart = value;
                  } else if (input == "inputDayPercent") {
                    state.calculator!.inputDayPercent = value;
                  } else if (input == "inputPremiumPercent") {
                    state.calculator!.inputPremiumPercent = value;
                  } else if (input == "inputPartJobPercent") {
                    state.calculator!.inputPartJobPercent = value;
                  } else if (input == "inputNightPercent") {
                    state.calculator!.inputNightPercent = value;
                  }
                  context
                      .read<MainBloc>()
                      .add(MainUpdateCalculator(state.calculator!));
                },
                keyboardType: TextInputType.number,
                controller: controller,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: labelText,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Icon(Icons.add, color: Colors.indigo),
          ),
          SizedBox(
            child: Text(state.calculator == null ? "" : amount.toString()),
          ),
        ],
      );
    });
  }
}
