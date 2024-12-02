import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:ecommerce_app/widgets/email_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  String _email = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildDescriptionLabel(),
          const SizedBox(height: 40),
          buildEmailTextField(),
          const SizedBox(height: 40),
          buildSendButton(),
        ],
      ),
    );
  }

  Widget buildDescriptionLabel() {
    return Text(
      "Please enter your email address. You will receive a link to create a new password via email.",
      style: AppTextStyle.regular(fontSize: 16),
    );
  }

  Widget buildEmailTextField() {
    return EmailTextField(
      emailController: _emailController,
      onSaved: (value) => setState(() => _email = value!),
    );
  }

  Widget buildSendButton() {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        title: 'SEND',
        onPressed: _onSendButtonPressed,
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Functions
  _onSendButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("Email: $_email");
    }
  }
}
