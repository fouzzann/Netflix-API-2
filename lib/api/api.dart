import 'dart:convert';
import 'dart:math';
import 'package:netflix/widgets/constants.dart';
import 'package:netflix/widgets/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';
  static const _topRatedUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upComingUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';


   Future<List<Movies>> getTrendingMovies() async {
   try{
      final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movies.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
   }catch (e){
    throw Exception("getTrendingMovies${e}");
   }
  }

  Future<List<Movies>> getTopRatedMovies() async {
    try{
          final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movies.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
    }catch (e){
      throw Exception('getTopRatedMovies ${e}');
    }
  }

  Future<List<Movies>> getUpcomingMovies() async {
    try{
      final response = await http.get(Uri.parse(_upComingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movies.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
    }catch(e){
      throw Exception("getUpcomingMovies:${e}");
    }
    
  }
  
   Future<List<Movies>> newOnNetflix() async {
   try{
      final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      List<Movies> newonNetflix = decodedData.map((movie) => Movies.fromJson(movie)).toList();
      newonNetflix.shuffle(Random());
      return newonNetflix;
    } else {
      throw Exception('Something happened');
    }
   }catch (e){
    throw Exception("getTrendingMovies${e}");
   }
  }

 
}
