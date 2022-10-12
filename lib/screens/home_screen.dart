import 'package:flutter/material.dart';
import 'package:pelisflix/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    print(moviesProvider.onDisplayMovies);
    return Scaffold(
      appBar: AppBar(
        title: const Text('PelisFlix'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            // slider de peliculas
            const MovieSlider()
      
          ],
        ),
      ),
    );
  }
}
