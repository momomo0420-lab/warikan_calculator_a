import 'package:flutter/material.dart';
import 'package:warikan_calculator/ui/warikan_calculator/warikan_calculator_body.dart';

class WarikanCalculatorScreen extends StatelessWidget {
  const WarikanCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('割り勘金額計算機')),
      body: const WarikanCalculatorBody(),
    );
  }
}
