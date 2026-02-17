import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab_15/MathFunc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_lab_15/main.dart';


void main() {
  // y = 8x^2 - 9x
  group('mathfunc', (){
    test('first', (){
      Decimal result = Mathfunc.calculate(Decimal.parse('0'));
      expect(result, (Decimal.parse('0')));
    });

    test('second', (){
      Decimal result = Mathfunc.calculate(Decimal.parse('1.2'));
      expect(result, Decimal.parse('0.72'));
    });

    test('third', (){
      Decimal result = Mathfunc.calculate(Decimal.parse('-0.2'));
      expect(result, Decimal.parse('2.12'));
    });


  });
}