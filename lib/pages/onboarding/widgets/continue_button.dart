import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final Function() onPressed;

  const ContinueButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        title: 'Start shopping',
        onPressed: onPressed,
      ),
    );
  }
}
