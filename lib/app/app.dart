import 'package:flutter/material.dart';
import 'package:number_generatorr/screen/number_generator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NumberGeneratorScreen(),
    );
  }
}
