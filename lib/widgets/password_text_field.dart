import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;
  final String labelText;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;

  const PasswordTextField({
    super.key,
    required this.passwordController,
    required this.labelText,
    this.focusNode,
    this.onFieldSubmitted,
    this.validator,
    this.onChanged,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      onSaved: onSaved,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: labelText,
        labelStyle: AppTextStyle.regular(fontSize: 18),
      ),
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      validator: _validatorDecorator,
      obscureText: true,
    );
  }

  String? _validatorDecorator(String? value) {
    if (validator != null) {
      String? v = _validator(value);

      return v ?? validator!(v);
    }

    return _validator(value);
  }

  String? _validator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (!Utils.passwordMinSize(value,
        minSize: Constants.minPasswordSize)) {
      return 'Your password must be at least ${Constants.minPasswordSize} characters';
    }
    return null;
  }
}
