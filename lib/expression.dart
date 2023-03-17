import 'package:math_expressions/math_expressions.dart';

class Exp {
  String _exp = '';
  final List<String> operations = ['/', '*', '+', '-'];

  Exp() {
    _exp = '';
  }

  String getExpression() {
    return _exp;
  }

  void setExpression(String data) {
    if (data == '=') {
      try {
        Parser p = new Parser();
        Expression expression = p.parse(_exp);
        ContextModel cm = ContextModel();
        _exp = '${expression.evaluate(EvaluationType.REAL, cm)}';
      } catch (e) {
        _exp = 'Error';
      }
    }

    if (data == '<=') {
      _exp = _exp.substring(0, _exp.length - 1);
    }

    if (data == 'C') {
      _exp = '';
    }

    if (data != '=' && data != 'C' && data != '<=' && data != 'null') {
      _exp += data;
    }

    /* if (!operations.contains(data)) {
      _exp += data;
    } else {
      if (_exp.contains('+')) {
        var nums = _exp.split('+');
        double first = double.parse(nums[0]);
        double second = double.parse(nums[1]);
        double result = first + second;
      }
      if (_exp.contains('-')) {
        var nums = _exp.split('-');
        double first = double.parse(nums[0]);
        double second = double.parse(nums[1]);
        double result = first - second;
      }
      if (_exp.contains('*')) {
        var nums = _exp.split('*');
        double first = double.parse(nums[0]);
        double second = double.parse(nums[1]);
        double result = first + second;
      }
      if (_exp.contains('/')) {
        var nums = _exp.split('/');
        double first = double.parse(nums[0]);
        double second = double.parse(nums[1]);
        double result = first + second;
      }
      _exp = result.toString() + data;
      result = 0;
    }*/
  }
}
