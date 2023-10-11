import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warikan_calculator/ui/warikan_calculator/warikan_calculator_body.dart';
import 'package:warikan_calculator/ui/warikan_calculator/warikan_calculator_viewmodel.dart';

class WarikanCalculatorScreen extends ConsumerWidget {
  const WarikanCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ビューモデル
    final viewModel = ref.watch(warikanCalculatorViewModelProvider.notifier);
    // 状態
    final state = ref.watch(warikanCalculatorViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('割り勘金額計算アプリ')),
      body: WarikanCalculatorBody(
        viewModel: viewModel,
        state: state
      ),
    );
  }
}
