import 'package:expressions/expressions.dart';

class CalculatorBrain {
  double getCalculation(String exp) {
    return _evaluateExpression(exp);
  }

  double _evaluateExpression(String expression) {
    try {
      final modExpression =
          expression.replaceAll('×', ' * ').replaceAll('÷', ' / ');

      // Parse the expression
      final expr = Expression.parse(modExpression);

      // Create a context with no variables (empty map)
      const evaluator = ExpressionEvaluator();
      final result = evaluator.eval(expr, {});

      return result.toDouble();
    } catch (e) {
      return 0.0;
    }
  }
}
