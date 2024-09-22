import 'package:flutter/material.dart';
import 'package:netflix/widgets/constants.dart';
import 'package:netflix/widgets/models/model.dart';
import 'package:netflix/widgets/models/screens/details_screen.dart';

class Search extends StatefulWidget {
  const Search({
    super.key,
    required this.trendingMovies,
    required this.topRatedMovies,
    required this.upcomingMovies,
    required this.searchQuery,
  });

  final Future<List<Movies>> trendingMovies;
  final Future<List<Movies>> topRatedMovies;
  final Future<List<Movies>> upcomingMovies;
  final String searchQuery;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _searchQuery = "";

  void _filterMovies(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [Icon(Icons.cast,
          color: Colors.white,
          size: 25,),
          SizedBox(width: 25,)
          ],
          
        title: Row(
          children: [
            Image.asset('assets/N.png',
            height: 35)
          ],
        ),
        leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back,
        color: Colors.white,)),
       
        backgroundColor: Colors.black, 
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0), 
              child: TextField(
                decoration: InputDecoration(
                      hintText: 'Search Movies',
                          hintStyle: TextStyle(color: Colors.grey),
                         border: InputBorder.none,
                         prefixIcon: Padding(
                           padding: const EdgeInsets.only(bottom: 7),
                           child: Icon(Icons.search,
                           color: Colors.grey,),
                         )
                       ),
                style: TextStyle(color: Colors.white),
                onChanged: _filterMovies,
              ),
              
            ),
          
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                'Top Searched Movies',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            FutureBuilder<List<Movies>>(
              future: Future.wait([widget.trendingMovies])
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
                    shrinkWrap: true, // Allows GridView to take only needed space
                    physics: NeverScrollableScrollPhysics(), // Disable scrolling in GridView
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
          ],
        ),
      ),
    );
  }
}
