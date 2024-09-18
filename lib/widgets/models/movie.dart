class Movies {
   
    String backdropPath;
    String originalTitle;
    String overview;
    String posterPath;
    DateTime releaseDate;
    String title;
    double voteAverage;

    Movies({

        required this.backdropPath,
        required this.originalTitle,
        required this.overview,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.voteAverage,
  
    });

    factory Movies.fromJson(Map<String, dynamic> json) => Movies(   
         title: json["title"],
        backdropPath: json["backdrop_path"],      
        originalTitle: json["original_title"],
        overview: json["overview"],     
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]), 
        voteAverage: json["vote_average"].toDouble(),
    );
}