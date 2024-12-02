import 'package:ecommerce_app/pages/home/home_page.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:ecommerce_app/widgets/email_text_field.dart';
import 'package:ecommerce_app/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'social_card.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _name = "";
  String _email = "";
  String _password = "";
  String _newPassword = "";
  String _phone = "";

  final FocusNode _focusNodeField1 = FocusNode();
  final FocusNode _focusNodeField2 = FocusNode();
  final FocusNode _focusNodeField3 = FocusNode();
  final FocusNode _focusNodeField4 = FocusNode();
  final FocusNode _focusNodeField5 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Flexible(
        child: Column(
          children: [
            buildNameTextField(),
            const SizedBox(height: 25),
            buildEmailTextField(),
            const SizedBox(height: 25),
            buildPasswordTextField(),
            const SizedBox(height: 25),
            buildNewPasswordTextField(),
            const SizedBox(height: 25),
            buildPhoneTextField(),
            const SizedBox(height: 50),
            buildSignUpButton(),
            const SizedBox(height: 20),
            buildTermsAndConditionsLabel(),
            const SizedBox(height: 40),
            buildSocialMedia(),
          ],
        ),
      ),
    );
  }

  Widget buildNameTextField() {
    return TextFormField(
      controller: _nameController,
      onSaved: (value) => setState(() => _name = value!),
      decoration: const InputDecoration(
        hintText: 'Name',
        labelStyle: TextStyle(fontSize: 18),
      ),
      focusNode: _focusNodeField1,
      onFieldSubmitted: (_) => _focusNodeField2.requestFocus(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
    );
  }

  Widget buildEmailTextField() {
    return EmailTextField(
      emailController: _emailController,
      focusNode: _focusNodeField2,
      onFieldSubmitted: (_) => _focusNodeField3.requestFocus(),
      onSaved: (value) => setState(() => _email = value!),
    );
  }

  Widget buildPasswordTextField() {
    return PasswordTextField(
      labelText: 'Password',
      passwordController: _passwordController,
      focusNode: _focusNodeField3,
      onFieldSubmitted: (_) => _focusNodeField4.requestFocus(),
      onChanged: (value) => setState(() => _password = value!),
    );
  }

  Widget buildNewPasswordTextField() {
    return PasswordTextField(
      passwordController: _newPasswordController,
      labelText: 'New Password',
      focusNode: _focusNodeField4,
      onFieldSubmitted: (_) => _focusNodeField5.requestFocus(),
      validator: (value) {
        print("$_password: $_newPassword");
        if (_password != _newPassword) {
          return "Password doesn't match";
        }

        return null;
      },
      onChanged: (value) => setState(() => _newPassword = value!),
    );
  }

  Widget buildPhoneTextField() {
    return TextFormField(
      controller: _phoneController,
      focusNode: _focusNodeField5,
      onSaved: (value) => setState(() => _phone = value!),
      decoration: const InputDecoration(
        hintText: 'Phone',
        labelStyle: TextStyle(fontSize: 18),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone';
        }
        return null;
      },
      maxLength: 10,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
    );
  }

  Widget buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        title: 'SIGN UP',
        onPressed: _onSignUpButtonPressed,
      ),
    );
  }

  Widget buildTermsAndConditionsLabel() {
    return Text(
      'By continuing your confirm that you agree with our Term and Condition',
      style: AppTextStyle.regular(
        fontSize: 16,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildSocialMedia() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialCard(image: "assets/images/social/google.png"),
        SocialCard(image: "assets/images/social/facebook.png"),
        SocialCard(image: "assets/images/social/twitter.png"),
      ],
    );
  }

  @override
  void dispose() {
    _focusNodeField1.dispose();
    _focusNodeField2.dispose();
    _focusNodeField3.dispose();
    _focusNodeField4.dispose();
    _focusNodeField5.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  //Functions
  _onSignUpButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print("name $_name");
      print("email $_email");
      print("password $_password");
      print("newPassword $_newPassword");
      print("phone $_phone");

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }
}
