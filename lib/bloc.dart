import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salary_calculator/color_bloc.dart';

void main() {
  runApp(MyBlockApp());
}

class MyBlockApp extends StatelessWidget {
  const MyBlockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Flutter',
      home: MyHomePageBloc(),
    );
  }
}

class MyHomePageBloc extends StatefulWidget {
  MyHomePageBloc({super.key});

  @override
  State<MyHomePageBloc> createState() => _MyHomePageBlocState();
}

class _MyHomePageBlocState extends State<MyHomePageBloc> {
  final ColorBloc _bloc = ColorBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BloC with Stream'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.outputStateStream,
          initialData: Colors.red,
          builder: (context, snapShot) {
            return AnimatedContainer(
              height: 100,
              width: 100,
              duration: Duration(microseconds: 500),
              color: snapShot.data,
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              _bloc.inputEventSink.add(ColorEvent.event_red);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              _bloc.inputEventSink.add(ColorEvent.event_green);
            },
          ),
        ],
      ),
    );
  }
}
