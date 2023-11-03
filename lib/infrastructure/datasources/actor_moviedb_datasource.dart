import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/enviroment.dart';

import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';

import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDbDataSource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3/movie",
      queryParameters: {
        "api_key": Enviroment.themovieDbKey,
        "language": "es-MX",
      }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/$movieId/credits');
    final castResponse = CreditsResponse.fromJson(response.data);
    final List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    return actors;
  }
}
