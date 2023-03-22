import 'package:form_field_validator/form_field_validator.dart';

class PhoneValidator extends TextFieldValidator {
  /// regex pattern to validate email inputs.
  final Pattern _phonePattern =
      r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$";

  PhoneValidator({required String errorText}) : super(errorText);

  @override
  bool isValid(String? value) =>
      hasMatch(_phonePattern.toString(), value!, caseSensitive: false);
}

class RetypePwdValidator extends TextFieldValidator {
  RetypePwdValidator(
      {required String retypePwd,
      required String pwd,
      required String errorText})
      : super(errorText);

  String? get retypePwd => null;

  @override
  bool isValid(String? value) =>
      hasMatch(value!, retypePwd!, caseSensitive: false);
}
