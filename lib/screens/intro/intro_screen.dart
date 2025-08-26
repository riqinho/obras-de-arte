import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:obras_de_arte/data/settings_repository.dart';
import 'package:obras_de_arte/routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  SettingRepository? _settingRepository;

  @override
  void initState() {
    super.initState();
    _initRespository();
  }

  Future<void> _initRespository() async {
    final repo = await SettingRepository.create();
    setState(() {
      _settingRepository = repo;
    });
  }

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
  Future<void> _finishIntro() async {
    await _settingRepository?.setShowIntro(!_dontShowAgain);
    if (!mounted) return;
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

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == _pages.length - 1;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        // Aqui será adicionado o conteudo da intro
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
            // Aqui será adicionado o checkbox
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
            // Aqui serão adicionados os botões de navegação
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botão Voltar à partir da tela 2
                  if (_currentPage > 0)
                    TextButton(onPressed: _onBack, child: Text('Voltar'))
                  else
                    SizedBox(width: 80), // espaço para alinhar
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
