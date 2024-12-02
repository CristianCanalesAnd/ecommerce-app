import 'package:ecommerce_app/widgets/custom_keyboard_container.dart';
import 'package:flutter/material.dart';

import 'signup_form.dart';
import 'signup_header.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return const CustomKeyboardContainer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              SignUpHeader(),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
