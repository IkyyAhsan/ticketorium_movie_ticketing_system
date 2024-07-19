import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/domain/usecases/get_movie_list/get_movie_list.dart';
import 'package:ticketorium_app_project/presentation/providers/repositories/movie_repository/movie_repository_provider.dart';

part 'get_movie_list_provider.g.dart';

@riverpod
GetMovieList getMovieList(GetMovieListRef ref) => GetMovieList(movieRepository: ref.watch(movieRepositoryProvider));