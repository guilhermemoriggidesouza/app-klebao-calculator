import 'package:flutter/material.dart';
class Memory {
  static const String OPERATIONS = "+-X/%=";
  String result = "0";
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  bool _operationUsed = false;
  String _operation;

  void applyCommand(String label) {
    if (label == "AC") {
      _clear();
    } else if (label == 'DEL') {
      _deleteEndDigit();
    } else if (OPERATIONS.contains(label)) {
      _setOperation(label);
    } else {
      _addDigit(label);
    }
  }

  _deleteEndDigit() {
    result = result.length == 1 ? '0' : result.substring(0, result.length - 1);
  }

  _clear() {
    result = "0";
    _operationUsed = false;
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operation = null;
  }

  _setOperation(String operation) {
    if (_bufferIndex == 0) {
      if (operation != '=') {
        _bufferIndex++;
      }
    } else {
      if (operation == '=' || !_operationUsed) {
        _buffer[0] = _calculate();
        result = _buffer[0].toString();
        result = result.endsWith('.0') ? result.replaceAll('.0', '') : result;
      }
    }
    _operationUsed = true;
    if (operation != '=') {
      _operation = operation;
    }
  }

  _addDigit(String digit) {
    if (_operationUsed) result = '0';
    if (result == '0' && digit != '.') {
      result = '';
    }

    if (digit == '.' && result.contains('.')) {
      digit = '';
    }

    result += digit;
    _buffer[_bufferIndex] = double.parse(result);
    _operationUsed = false;
  }

  _calculate() {
    switch (_operation) {
      case '+':
        return _buffer[0] + _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'X':
        return _buffer[0] * _buffer[1];
      case '%':
        return _buffer[0] % _buffer[1];
    }
  }
}