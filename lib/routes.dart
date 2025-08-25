import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static const String splash = '/';
  static const String intro = '/intro';
  static const String home = '/home';

  //interpretação das rotas
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case intro:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case home:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('Rota não encontrada')),
              ),
        );
    }
  }
}
