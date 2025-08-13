import 'package:flutter/material.dart';
import 'package:obras_de_arte/routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<Map<String, String>> _pages = [
    {
      'title': 'Welcome to Obras de Arte',
      'subtitle': 'Discover the beauty of art from around the world.',
      'lottie': 'assets/lottie/intro1.json',
    },
    {
      'title': 'Functionalities',
      'subtitle': 'Browse through many functionalities and features.',
      'lottie': 'assets/lottie/intro2.json',
    },
    {
      'title': 'Start Right Now',
      'subtitle': 'Let\'s start exploring the app!',
      'lottie': 'assets/lottie/intro3.json',
    },
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _dontShowAgain = false;

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      _finishIntro();
    }
  }

  void _onBack() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _finishIntro() {
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == _pages.length - 1;
    return const Placeholder();
  }
}
