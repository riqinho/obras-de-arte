import 'package:flutter/material.dart';
import 'package:obras_de_arte/screens/home/home.dart';
import 'package:obras_de_arte/screens/intro/intro_screen.dart';
import 'package:obras_de_arte/screens/splash/splash_screen.dart';

class Routes {
  // criando mapeamento de rotas, centralizando as rotas da aplicação
  static const String splash = '/'; // rota inicial
  static const String home = '/home';
  static const String intro = '/intro';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case intro:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${routeSettings.name}'),
                ),
              ),
        );
    }
  }
}

// class ArtworkDetailsArguments {
//   final Artwork artwork;
//   ArtworkDetailsArguments(this.artwork);
// }
