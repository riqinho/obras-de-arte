import 'package:flutter/material.dart';
import 'package:obras_de_arte/routes.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    // lista com os dados que serão usados nas páginas de introdução
    final List<Map<String, String>> _pages = [
      {
        'title': 'Bem-vindo ao App',
        'subtitle': 'Aprenda a usar o app passo a passo.',
        'lottie': 'assets/lottie/intro1.json',
      },
      {
        'title': 'Funcionalidades',
        'subtitle': 'Explore as diversas funcionalidades.',
        'lottie': 'assets/lottie/intro2.json',
      },
      {
        'title': 'Comece Agora',
        'subtitle': 'Vamos começar a usar o app!',
        'lottie': 'assets/lottie/intro3.json',
      },
    ];

    // variáveis para o controle da intro
    final PageController _pageController = PageController();
    int _currentPage = 0;
    bool _dontShowAgain = false;

    // fun para finalizar a intro e navegar para a home
    _finishIntro() {
      Navigator.pushReplacementNamed(context, Routes.home);
    }

    // fun para navegar para a próxima página
    void _onNext() {
      if (_currentPage < _pages.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        _finishIntro();
      }
    }

    // fun para navegar para a página anterior
    void _onBack() {
      if (_currentPage > 0) {
        _pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    }

    return const Placeholder();
  }
}
