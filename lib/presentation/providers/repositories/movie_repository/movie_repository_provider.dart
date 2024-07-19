import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/data/repositories/movie_repository.dart';
import 'package:ticketorium_app_project/data/tmdb/tmdb_movie_repository.dart';

part 'movie_repository_provider.g.dart';

@riverpod
MovieRepository movieRepository(MovieRepositoryRef ref) => TmdbMovieRepository();