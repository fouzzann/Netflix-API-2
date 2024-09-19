import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/widgets/coming_soon_widget.dart';
import 'package:netflix/widgets/models/movie.dart';
import 'package:netflix/widgets/models/screens/profile.dart';
import 'package:netflix/widgets/models/screens/search_movies.dart';
import 'package:netflix/widgets/movie_slider.dart';
import 'package:netflix/widgets/trending.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movies>> trendingMovies;
  late Future<List<Movies>> topRatedMovies;
  late Future<List<Movies>> upcomingMovies;
  late Future<List<Movies>> top10Movies;
  late Future<List<Movies>> wethings;
  late Future<List<Movies>> newonNetflixMovies;
  int _selectedIndex = 0;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getUpcomingMovies();
    newonNetflixMovies = Api().newOnNetflix();
    
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _filterMovies(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          Icon(Icons.cast,
          color: Colors.white,
          size: 25,),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.search,
          color: Colors.white,
          size: 25,),

          SizedBox(
            width: 15,
          )
        ],
        backgroundColor: Colors.
        black,
        title: _selectedIndex == 1
            ? Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.white),
                      onChanged: _filterMovies,
                    ),
                  ),
                ],
              )
            : Image.asset(
                'assets/N.png',
                height: 35,
              ),
     
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeContent(),
          Search(trendingMovies: trendingMovies, topRatedMovies: topRatedMovies, upcomingMovies: upcomingMovies, searchQuery:_searchQuery ),
          _buildNewAndHot()
        ],
      ),
     bottomNavigationBar: BottomNavigationBar(
   items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.video_library,
        ),
        label: 'New & Hot' 
      ),
  
   ],
  currentIndex: _selectedIndex,
  selectedItemColor: Colors.red,
  unselectedItemColor: Colors.white,
  backgroundColor: Colors.black,
  onTap: _onItemTapped,
),

    );
  }
  _buildNewAndHot(){
   return DefaultTabController(
    length: 2, 
     child: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black, 
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text('New & hot',
          style: TextStyle(
            color: Colors.white
          ),
          ),
          actions: [
        IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> Profile()));
        }, icon: Icon(Icons.person_outlined,
        color: Colors.white,
        size: 25 ,
        )),
             SizedBox(
              width: 20,
             ),
             
            SizedBox(
              width: 20, 
            ) 
          ],
          bottom: TabBar( 
            dividerColor: Colors.black,
            isScrollable: false,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white ,
            ),
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 14   
             ),
             unselectedLabelColor: Colors.white,
            tabs:[ 
              Tab( 
                text: "🍿 Coming soon ",
              ),
              Tab(
                text: "🔥 Everyone's Watching", 
              )
            ] ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView( 
              child: Column(
                children: [
                   ComingSoonMovieWidget(
                      imageUrl:
                          'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                      overview:
                          'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                      logoUrl:
                          "https://s3.amazonaws.com/www-inside-design/uploads/2017/10/strangerthings_feature-983x740.jpg",
                      month: "Jun",
                      day: "19",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ComingSoonMovieWidget(
                      imageUrl:
                          'https://www.pinkvilla.com/images/2022-09/rrr-review.jpg',
                      overview:
                          'A fearless revolutionary and an officer in the British force, who once shared a deep bond, decide to join forces and chart out an inspirational path of freedom against the despotic rulers.',
                      logoUrl:
                          "https://www.careerguide.com/career/wp-content/uploads/2023/10/RRR_full_form-1024x576.jpg",
                      month: "Mar",
                      day: "07",
                    ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  ComingSoonMovieWidget(
                            imageUrl:
                                'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                            overview:
                                'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                            logoUrl:
                                "https://s3.amazonaws.com/www-inside-design/uploads/2017/10/strangerthings_feature-983x740.jpg",
                            month: "Jun",
                            day: "19",
                          ),
                ],
              ),
            ),
                    SizedBox(
                      height: 20,
                    ),
                    ComingSoonMovieWidget(
                      imageUrl:
                          'https://www.pinkvilla.com/images/2022-09/rrr-review.jpg',
                      overview:
                          'A fearless revolutionary and an officer in the British force, who once shared a deep bond, decide to join forces and chart out an inspirational path of freedom against the despotic rulers.',
                      logoUrl:
                          "https://www.careerguide.com/career/wp-content/uploads/2023/10/RRR_full_form-1024x576.jpg",
                      month: "Mar",
                      day: "07",
                    ),
        ]),
     ),
     )
    );
  }

   _buildHomeContent() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 360,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/johnwick.jpg'))
              ),
            ),
          ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Column(
                children: [
                  Icon(Icons.add,
                  size: 30,
                            color: Colors.white,),
                            Text('My List',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                            ),)
                ],
              ),
              SizedBox(width: 34,),
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white ,              
                ),
                child: Row(
                  children: [
                    Icon(Icons.play_arrow,
                    size: 35),
                    SizedBox(width: 5,),
                    Text('Play',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                  
                ),

                
              
              ),
              SizedBox(width: 30,),
              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.info_outline_rounded,
                      color: Colors.white,
                      size: 30,),
                      Text('Info',
                      style: TextStyle(
                        color: Colors.white
                      ),)
                    ],
                  )
                ],
              )
          ],
          
          
        ),
        
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Trending Now',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 30),
          FutureBuilder<List<Movies>>(
            future: trendingMovies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)),
                );
              } else {
                return TrendingSlider(snapshot: snapshot);
              }
            },
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Top Rated Movies',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 30),
          FutureBuilder<List<Movies>>(
            future: topRatedMovies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)),
                );
              } else {
                return MovieSlider(snapshot: snapshot);
              }
            },
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Upcoming Movies',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 30),
          FutureBuilder<List<Movies>>(
            future: upcomingMovies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)),
                );
              } else {
                return MovieSlider(snapshot: snapshot);
              }
            },
          ),
          // SizedBox(height: 30),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     'Top 10 Movies',
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.w500,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          // SizedBox(height: 30),
          // FutureBuilder<List<Movies>>(
          //   future: top10Movies,
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(child: CircularProgressIndicator());
          //     } else if (snapshot.hasError) {
          //       return Center(
          //         child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)),
          //       );
          //     } else {
          //       return MovieSlider(snapshot: snapshot);
          //     }
          //   },
          // ),

          // SizedBox(height: 30),
          // FutureBuilder<List<Movies>>(
          //   future: upcomingMovies,
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(child: CircularProgressIndicator());
          //     } else if (snapshot.hasError) {
          //       return Center(
          //         child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)),
          //       );
          //     } else {
          //       return MovieSlider(snapshot: snapshot);
          //     }
          //   },
          // ),
          // SizedBox(height: 30),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     "We Think You'll Love This",
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.w500,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          // SizedBox(height: 30),
          // FutureBuilder<List<Movies>>(
          //   future: top10Movies,
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(child: CircularProgressIndicator());
          //     } else if (snapshot.hasError) {
          //       return Center(
          //         child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)),
          //       );
          //     } else {
          //       return MovieSlider(snapshot: snapshot);
          //     }
          //   },
          // ), 

           SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "New on Netflix",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 30),
          FutureBuilder<List<Movies>>(
            future: trendingMovies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)),
                );
              } else {
                return MovieSlider(snapshot: snapshot);
              }
            },
          ), 
          
           ],

           
      ),
    );
  }
}


