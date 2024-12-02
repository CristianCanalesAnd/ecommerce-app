import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final Function(String?) onSaved;

  const EmailTextField({
    super.key,
    required this.emailController,
    this.focusNode,
    this.onFieldSubmitted,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      onSaved: onSaved,
      decoration: InputDecoration(
        hintText: 'Email',
        labelStyle: AppTextStyle.regular(fontSize: 18),
      ),
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!Utils.isEmailValid(value)) {
          return 'Your email is invalid';
        }

        return null;
      },
      keyboardType: TextInputType.emailAddress,
    );
  }
}
