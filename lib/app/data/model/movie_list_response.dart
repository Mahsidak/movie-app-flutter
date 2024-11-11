class MoviesResponse {
  final int page;
  final List<MovieData> results;

  MoviesResponse.MovieListResponse({required this.page, required this.results});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    return MoviesResponse.MovieListResponse(
      page: json['page'],
      results: (json['results'] as List).map((item) => MovieData.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'page': page,
    'results': results.map((item) => item.toJson()).toList(),
  };
}

class MovieData {
  final String? name;
  final String? title;
  final String? originalTitle;
  final String? description;
  final String? posterPath;
  final String? backdropPath;
  final int? id;
  final String? mediaType;
  final bool? adult;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final String? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final String? firstAirDate;
  final String? originCountry;

  MovieData({
    this.name,
    required this.title,
    required this.originalTitle,
    this.description,
    required this.posterPath,
    required this.backdropPath,
    required this.id,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.firstAirDate,
    this.originCountry,
  });

  factory MovieData.fromJson(Map<String, dynamic> json) {
    return MovieData(
      name: json['name'] ?? json['title'],
      title: json['title'],
      originalTitle: json['original_title'],
      description: json['description'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      mediaType: json['media_type'],
      adult: json['adult'],
      originalLanguage: json['original_language'],
      genreIds: List<int>.from(json['genre_ids']),
      popularity: json['popularity']?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? '',
      video: json['video'] ?? false,
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
      firstAirDate: json['first_air_date'],
      originCountry: json['origin_country'] != null ? json['origin_country'][0] : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'title': title,
    'original_title': originalTitle,
    'description': description,
    'poster_path': posterPath,
    'backdrop_path': backdropPath,
    'id': id,
    'media_type': mediaType,
    'adult': adult,
    'original_language': originalLanguage,
    'genre_ids': genreIds,
    'popularity': popularity,
    'release_date': releaseDate,
    'video': video,
    'vote_average': voteAverage,
    'vote_count': voteCount,
    'first_air_date': firstAirDate,
    'origin_country': originCountry != null ? [originCountry] : null,
  };
}