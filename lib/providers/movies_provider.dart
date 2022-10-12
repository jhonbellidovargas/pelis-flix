import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pelisflix/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '19fdfa04ac548b85e48bb87a45900d1d';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('MoviesProvider constructor');
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(
      _baseUrl,
      '3/movie/now_playing',
      {
        'api_key': _apiKey,
        'language': _language,
        'page': '1',
      },
    );
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }
}
