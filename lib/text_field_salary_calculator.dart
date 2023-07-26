import 'package:flutter/material.dart';

class TextFieldSalary extends StatelessWidget {
  const TextFieldSalary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
