import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:warikan_calculator/ui/warikan_calculator/warikan_calculator_viewmodel_state.dart';

part 'warikan_calculator_viewmodel.g.dart';

/// WarikanCalculatorのビューモデル
@riverpod
class WarikanCalculatorViewModel extends _$WarikanCalculatorViewModel {
  /// 初期化処理
  @override
  WarikanCalculatorViewModelState build() {
    return WarikanCalculatorViewModelState(
      amountController: TextEditingController(),
      taxRateController: TextEditingController(),
      numberController: TextEditingController(),
      isTaxIncluded: false,
    );
  }

  /// 税率の有無を設定する
  ///
  /// [taxIncluded]を基に税率の有無を設定する
  void setTaxIncluded(bool taxIncluded) {
    state = state.copyWith(isTaxIncluded: taxIncluded);
  }

  void clearAmountController() {
    state.amountController.clear();
  }

  void clearTaxRateController() {
    state.taxRateController.clear();
  }

  void clearNumberController() {
    state.numberController.clear();
  }

  /// 必要なすべての項目の入力が終わっているか判定する
  bool _checkAllFieldEntered() {
    var result = true;

    // 金額と人数が入力されていない場合は無効
    if((state.amountController.text == "") ||
        (state.numberController.text == "")) {
      result = false;
    }

    // 税別価格なのに税率が入力されていない場合は無効
    if(!state.isTaxIncluded && (state.taxRateController.text == "")) {
      result = false;
    }

    return result;
  }

  /// 割り勘金額を計算する
  void calculateAmountPerPerson(
    Function(double result)? onSuccess,
    Function()? onFailure
  ) {
    if(!_checkAllFieldEntered()) {
      if(onFailure != null) onFailure();
      return;
    }

    var amount = double.parse(state.amountController.text);

    if(!state.isTaxIncluded) {
      final taxRate = int.parse(state.taxRateController.text);
      final tax = amount * taxRate / 100;
      amount += tax;
    }

    final number = int.parse(state.numberController.text);

    if(onSuccess != null) onSuccess(amount / number);
  }
}