import 'package:calculator_floor_tarde/core/constants.dart';

class ValidatorHelper {
  static String isNotEmptyValue(String text) {
    double value = 0.0;
    value = double.tryParse(text);
    if (text.isEmpty) {
      return kValidate ?? null;
    }
    if (text.isNotEmpty) {
      if (value == 0) {
        return kValidateZero ?? null;
      }
      if (value.isNegative) {
        return kValidateNegative ?? null;
      }
    }
    return null;
  }
}
