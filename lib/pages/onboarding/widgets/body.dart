import 'package:ecommerce_app/pages/login/login_page.dart';
import 'package:ecommerce_app/pages/onboarding/models/onboarding_model.dart';
import 'package:ecommerce_app/pages/onboarding/widgets/continue_button.dart';
import 'package:ecommerce_app/pages/onboarding/widgets/onboarding_dots.dart';
import 'package:ecommerce_app/pages/onboarding/widgets/onboarding_pages.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<OnboardingPageModel> _pages = [
    OnboardingPageModel(
      title: 'Discover',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      image: 'assets/images/onboarding/slide1.png',
    ),
    OnboardingPageModel(
      title: 'New Arrivals',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      image: 'assets/images/onboarding/slide2.png',
    ),
    OnboardingPageModel(
      title: 'Best Sellers',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      image: 'assets/images/onboarding/slide3.png',
    ),
  ];

  final PageController _pageController = PageController();
  int _indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: OnboardingPages(
              pages: _pages,
              controller: _pageController,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  OnboardingDots(
                    dotsLength: _pages.length,
                    indexSelected: _indexSelected,
                    onDotPressed: _onDotPressed,
                  ),
                  const SizedBox(height: 40),
                  buildContinueButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContinueButton() {
    return ContinueButton(
      onPressed: _onContinuePressed,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Functions
  _onContinuePressed() {
    setState(() {
      _indexSelected++;
    });

    if (_indexSelected != _pages.length) {
      _animateToPage();
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const LogInPage()),
    );
  }

  _onPageChanged(int index) {
    setState(() {
      _indexSelected = index;
    });
  }

  _onDotPressed(int index) {
    setState(() {
      _indexSelected = index;
    });

    _animateToPage();
  }

  _animateToPage() {
    _pageController.animateToPage(
      _indexSelected,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
