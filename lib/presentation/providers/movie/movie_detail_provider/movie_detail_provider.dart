import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/domain/entities/movie/movie.dart';
import 'package:ticketorium_app_project/domain/entities/movie_detail/movie_detail.dart';
import 'package:ticketorium_app_project/domain/entities/result/result.dart';
import 'package:ticketorium_app_project/domain/usecases/get_movie_detail/get_movie_detail.dart';
import 'package:ticketorium_app_project/domain/usecases/get_movie_detail/get_movie_detail_param.dart';
import 'package:ticketorium_app_project/presentation/providers/usecase/get_movie_detail_provider/get_movie_detail_provider.dart';

part 'movie_detail_provider.g.dart';

@riverpod
Future<MovieDetail?> movieDetail(MovieDetailRef ref,
    {required Movie movie}) async {
  GetMovieDetail getMovieDetail = ref.read(getMovieDetailProvider);

  var movieDetailResult =
      await getMovieDetail(GetMovieDetailParam(movie: movie));

  return switch (movieDetailResult) {
    Success(value: final movieDetail) => movieDetail,
    Failed(message: _) => null
  };
}