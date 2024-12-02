import 'package:ecommerce_app/pages/forgot_password_page.dart/forgot_password_page.dart';
import 'package:ecommerce_app/pages/home/home_page.dart';
import 'package:ecommerce_app/pages/signup/signup_page.dart';
import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:ecommerce_app/widgets/email_text_field.dart';
import 'package:ecommerce_app/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            EmailTextField(
              emailController: _emailController,
              onSaved: (value) => setState(() => _email = value!),
            ),
            const SizedBox(height: 20),
            PasswordTextField(
              passwordController: _passwordController,
              labelText: 'Password',
              onSaved: (value) => setState(() => _password = value!),
            ),
            const SizedBox(height: 100),
            buildLogInButton(),
            const SizedBox(height: 40),
            buildForgotPasswordLabel(),
            const Spacer(),
            buildFacebookButton(),
            const SizedBox(height: 40),
            buildSignUpButton(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget buildLogInButton() {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        title: 'LOGIN',
        onPressed: _onLogInButtonPressed,
      ),
    );
  }

  Widget buildForgotPasswordLabel() {
    return GestureDetector(
      onTap: _onForgotPasswordPressed,
      child: Text(
        'Forgot your password?',
        style: AppTextStyle.regular(fontSize: 17),
      ),
    );
  }

  Widget buildFacebookButton() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          print("Facebook button pressed");
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(AppColors.facebook),
          textStyle:
              MaterialStatePropertyAll(AppTextStyle.semiBold(fontSize: 15)),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 14),
          ),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              side: BorderSide(color: AppColors.facebook, width: 2),
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
        child: Text(
          "LOGIN WITH FACEBOOK",
          style: AppTextStyle.semiBold(fontSize: 17),
        ),
      ),
    );
  }

  Widget buildSignUpButton() {
    return GestureDetector(
      onTap: _onSignUpButtonPressed,
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: AppTextStyle.regular(color: AppColors.dark, fontSize: 17),
          children: [
            TextSpan(
              text: "Sign up",
              style: AppTextStyle.semiBold(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //Functions
  _onLogInButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print("email $_email");
      print("password $_password");

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  void _onForgotPasswordPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
    );
  }

  void _onSignUpButtonPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }
}
