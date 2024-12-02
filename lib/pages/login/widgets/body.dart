import 'package:flutter/material.dart';
import 'package:ecommerce_app/pages/login/widgets/login_form.dart';

import 'login_header.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            LogInHeader(),
            SizedBox(height: 100),
            LogInForm(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
