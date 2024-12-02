import 'package:ecommerce_app/data/data.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class TopDealsPage extends StatefulWidget {
  const TopDealsPage({super.key});

  @override
  State<TopDealsPage> createState() => _TopDealsPageState();
}

class _TopDealsPageState extends State<TopDealsPage> {
  int _currentIndex = 0;
  Color get backgroundColor => topDeals[_currentIndex]['color'] as Color;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Body(
        topDeals: topDeals,
        indexSelected: _currentIndex,
        pageController: _pageController,
        onDotPressed: _onDotPressed,
        onPageChanged: _onPageChanged,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(backgroundColor: backgroundColor);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Functions
  _onDotPressed(index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  _onPageChanged(index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
