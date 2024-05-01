import 'package:flutter/material.dart';
import 'package:mathappcd/screens/home.dart';

void main() {
  runApp(const MathAppCD());
}

class MathAppCD extends StatelessWidget {
  const MathAppCD({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
