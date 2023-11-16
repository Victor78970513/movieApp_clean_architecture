import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
        adult: moviedb.adult,
        backdropPath: moviedb.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
            : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
        genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview,
        popularity: moviedb.popularity,
        posterPath: (moviedb.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
            : "https://cdn4.vectorstock.com/i/1000x1000/30/98/404-web-page-with-error-message-glitch-style-vector-27943098.jpg",
        // : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
        releaseDate:
            moviedb.releaseDate != null ? moviedb.releaseDate! : DateTime.now(),
        title: moviedb.title,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount,
      );

  static Movie movieDetailsToEntity(MovieDetails movie) => Movie(
        adult: movie.adult,
        backdropPath: (movie.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
            : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
        genreIds: movie.genres.map((e) => e.name).toList(),
        id: movie.id,
        originalLanguage: movie.originalLanguage,
        originalTitle: movie.originalTitle,
        overview: movie.overview,
        popularity: movie.popularity,
        posterPath: (movie.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
            : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
        releaseDate: movie.releaseDate,
        title: movie.title,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount,
      );
}
