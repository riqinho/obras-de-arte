import 'package:flutter/material.dart';
import 'package:obras_de_arte/data/models/artwork.dart';
import 'package:obras_de_arte/data/models/artwork_repository.dart';
import 'package:obras_de_arte/routes.dart';
import 'package:obras_de_arte/widget/artwork_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final repositoty = ArtworkRepository();
    return Scaffold(
      appBar: AppBar(title: const Text("Obras de Arte")),
      body: FutureBuilder<List<Artwork>>(
        future: repositoty.fetchArtworks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar obras'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhuma obraencontrada'));
          } else {
            final artworks = snapshot.data!;
            return ListView.builder(
              itemCount: artworks.length,
              itemBuilder: (context, index) {
                final art = artworks[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.details,
                      arguments: ArtworkDetailScreenArguments(art),
                    );
                  },
                  child: ArtworkListItem(artwork: art),
                );
              },
            );
          }
        },
      ),
    );
  }
}
