import 'package:ecommerce_app/pages/onboarding/models/onboarding_model.dart';
import 'package:ecommerce_app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class OnboardingPages extends StatelessWidget {
  final List<OnboardingPageModel> pages;
  final PageController controller;
  final Function(int) onPageChanged;

  const OnboardingPages({
    super.key,
    required this.pages,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      onPageChanged: onPageChanged,
      children: pages.map((page) => buildPage(page)).toList(),
    );
  }

  Widget buildPage(OnboardingPageModel page) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTitle(page.title),
        const SizedBox(height: 12),
        buildDescription(page.body),
        buildImage(page.image),
      ],
    );
  }

  Widget buildTitle(String title) {
    return Text(
      title,
      style: AppTextStyle.semiBold(fontSize: 26),
    );
  }

  Widget buildDescription(String description) {
    return Text(
      description,
      style: AppTextStyle.regular(fontSize: 19),
      textAlign: TextAlign.center,
    );
  }

  Widget buildImage(String image) {
    return Image.asset(
      image,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
