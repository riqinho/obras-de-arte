import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:obras_de_arte/routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<Map<String, String>> _pages = [
    {
      'title': 'Bem-vindo ao App',
      'subtitle': 'Aprenda a usar o app passo a passo.',
      'lottie': 'assets/lottie/intro1.json',
    },
    {
      'title': 'Funcionalidades',
      'subtitle': 'Explore as diversas funcionalidades',
      'lottie': 'assets/lottie/intro2.json',
    },
    {
      'title': 'Comece Agora',
      'subtitle': 'Vamos começar a usar o app!',
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // aqui é o conteúdo da tela intro
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Expanded(child: Lottie.asset(page['lottie']!)),
                        Text(
                          page['title']!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          page['subtitle']!,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // aqui será adicionado o checkbox
            if (isLastPage)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Checkbox(
                      value: _dontShowAgain,
                      onChanged: (val) {
                        setState(() {
                          _dontShowAgain = val ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text('Não mostrar essa introdução novamente'),
                    ),
                  ],
                ),
              ),
            // aqui serão adicionados os botões de navegação
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage > 0)
                    TextButton(onPressed: _onBack, child: Text('Voltar'))
                  else
                    SizedBox(
                      width: 80,
                    ), // Espaço reservado para manter o layout
                  TextButton(
                    onPressed: _onNext,
                    child: Text(isLastPage ? 'Concluir' : 'Avançar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
