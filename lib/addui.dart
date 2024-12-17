import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/prov.dart';

class Prov extends StatelessWidget {
  const Prov({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Consumer<Counter>(builder: (build, counter, context) {
              return Text("${counter.count}");
            }),
            FloatingActionButton(
              onPressed: () => {
                context.read<Counter>().add(),
              },
              child: const Text("ADD"),
            ),
            FloatingActionButton(
              onPressed: () => {
                context.read<Counter>().sub(),
              },
              child: const Text("SUB"),
            )
          ],
        ),
      ),
    );
  }
}
