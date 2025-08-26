import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:obras_de_arte/data/models/artwork.dart';
import 'package:obras_de_arte/screens/detail/artwork_detail_screen.dart';

class Routes {
  static const String splash = '/';
  static const String intro = '/intro';
  static const String home = '/home';
  static const String details = '/details';

  //interpretação das rotas
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case intro:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case home:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case details:
        final args = settings.arguments as ArtworkDetailScreenArguments;
        return MaterialPageRoute(
          builder: (_) => ArtworkDetailScreen(artwork: args.artwork),
        );
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

// Classe para argumentos passados para DetailScreen
class ArtworkDetailScreenArguments {
  final Artwork artwork;
  ArtworkDetailScreenArguments(this.artwork);
}
