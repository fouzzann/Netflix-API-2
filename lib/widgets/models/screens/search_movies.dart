import 'package:flutter/material.dart';
import 'package:netflix/widgets/constants.dart';
import 'package:netflix/widgets/models/movie.dart';
import 'package:netflix/widgets/models/screens/details_screen.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
    required this.trendingMovies,
    required this.topRatedMovies,
    required this.upcomingMovies,
    required String searchQuery,
   
  }) : _searchQuery = searchQuery; 

  final Future<List<Movies>> trendingMovies;
  final Future<List<Movies>> topRatedMovies;
  final Future<List<Movies>> upcomingMovies;
  final String _searchQuery;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Top Searched Movies',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Movies>>(
            future: Future.wait([trendingMovies, topRatedMovies, upcomingMovies])
                .then((List<List<Movies>> lists) => lists.expand((list) => list).toList()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)));
              } else {
                List<Movies> movies = snapshot.data!;
                if (_searchQuery.isNotEmpty) {
                  movies = movies.where((movie) {
                    return movie.title.toLowerCase().contains(_searchQuery.toLowerCase());
                  }).toList();
                }

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(movie: movies[index]),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(
                          "${Constants.imagePath}${movies[index].posterPath}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}