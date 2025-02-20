import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/domain/usecases/get_movie_detail/get_movie_detail.dart';
import 'package:ticketorium_app_project/presentation/providers/repositories/movie_repository/movie_repository_provider.dart';

part 'get_movie_detail_provider.g.dart';

@riverpod
GetMovieDetail getMovieDetail(GetMovieDetailRef ref) => GetMovieDetail(movieRepository: ref.watch(movieRepositoryProvider));