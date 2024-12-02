import 'package:ecommerce_app/pages/forgot_password_page.dart/widgets/header.dart';
import 'package:flutter/material.dart';

import 'forgot_password_form.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Header(),
            SizedBox(height: 20),
            ForgotPasswordForm(),
          ],
        ),
      ),
    );
  }
}
