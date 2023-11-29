import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculations with ChangeNotifier {
  String input = '';
  String output = '';
  List<String> characters = [
    'C',
    '÷',
    'X',
    'Del',
    '7',
    '8',
    '9',
    '-',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '.',
    '0',
    '(',
    ')',
    '=',
  ];

  // List<double> numbers = [];
  void onPressed(String key) {
    // if the key is c,del and =. I don't want to add them in my input string
    if (key == 'C' || key == 'Del' || key == '=') {
      switch (key) {
        case 'C':
          input = '';
          output = '';
          break;
        case 'Del':
          input = input.substring(0, input.length - 1);
          break;
        case '=':
          output = onPressedEqualsTo().toString();
          input = '';
          break;
        default:
          input = '';
          output = '';
      }
    }
    // if the keys are valid to add in input string
    else {
      if (output.isEmpty) {
        if (input.isEmpty) {
          input = input + key;
        } else {
          if ((isCalculationOperator(input[input.length - 1]) &&
              isCalculationOperator(key))) {
            input = input;
          } else if (isDecimal() && key == '.') {
            input = input;
          } else {
            input = input + key;
          }
        }
      } else {
        input = output + input + key;
        output = '';
      }
    }
    notifyListeners();
  }
  // check is number have an decimal or not

  bool isDecimal() {
    int lastOperationIndex = 0;
    String cleanedExpression = input.replaceAll(' ', '');
    for (var i = 0; i < cleanedExpression.length; i++) {
      if ('+-*/'.contains(cleanedExpression[i])) {
        lastOperationIndex = i;
      }
    }
    String decimalOrNot = input.substring(lastOperationIndex + 1, input.length);
    return decimalOrNot.contains('.');
  }

  bool isOperator(String operator) {
    if (operator == 'C' ||
        operator == 'X' ||
        operator == '+' ||
        operator == '÷' ||
        operator == '-' ||
        operator == '=' ||
        operator == '.' ||
        operator == 'Del') {
      return true;
    } else {
      return false;
    }
  }

  bool isCalculationOperator(String operator) {
    if (operator == '*' ||
        operator == '+' ||
        operator == '÷' ||
        operator == '-' ||
        operator == '.') {
      return true;
    } else {
      return false;
    }
  }

  String onPressedEqualsTo() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(input);
      ContextModel model = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, model);
      return result.toString();
    } catch (e) {
      return 'Invalid operation';
    }
  }
}
