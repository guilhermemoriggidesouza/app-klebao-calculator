class Memory {
  static const String OPERATIONS = "+-/x%=";

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  bool _operationUsed = false;
  String _operation;

  String result = '0';
  String history = '0';

  applyCommand(String label) {
    if (label == 'AC') {
      _clear();
    } else if (OPERATIONS.contains(label)) {
      history += label;
      _setOperation(label);
    } else if (label == 'DEL') {
      _deleteEndDigit();
    } else {
      _addDigit(label);
      history += label;
    }
  }

  _addDigit(String digit) {
    if (_operationUsed) result = '0';

    if (result == '0' && digit != '.') {
      result = '';
      history = '';
    }

    if (digit == '.' && result.contains('.')) {
      digit = '';
    }

    result += digit;
    _buffer[_bufferIndex] = double.parse(result);
    _operationUsed = false;
  }

  _clear() {
    result = '0';
    history = '0';
    _operationUsed = false;
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operation = null;
  }

  _deleteEndDigit() {
    result = result.length == 1 ? '0' : result.substring(0, result.length - 1);
  }

  _setOperation(operation) {
    if (_bufferIndex == 0) {
      if (operation != '=') {
        _bufferIndex++;
      }
    } else {
      _buffer[0] = _calculate();
      result = _buffer[0].toString().replaceAll('.0', '');
    }

    _operationUsed = true;
    if(operation != '='){
      _operation = operation;
    }
  }

  _calculate() {
    if (_operation == '+') return _buffer[0] + _buffer[1];
    if (_operation == '-') return _buffer[0] - _buffer[1];
    if (_operation == 'x') return _buffer[0] * _buffer[1];
    if (_operation == '/') return _buffer[0] / _buffer[1];
    if (_operation == '%') return _buffer[0] % _buffer[1];
  }
}