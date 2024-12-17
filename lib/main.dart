import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/addui.dart';
import 'package:test_app/pages/homepage.dart';
import 'package:test_app/prov.dart';
import 'package:test_app/providers/listprovider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Counter()),
      ChangeNotifierProvider(create: (_) => TaskList()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
