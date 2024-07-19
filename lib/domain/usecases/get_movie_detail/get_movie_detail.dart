import 'package:ticketorium_app_project/data/repositories/movie_repository.dart';
import 'package:ticketorium_app_project/domain/entities/movie_detail/movie_detail.dart';
import 'package:ticketorium_app_project/domain/entities/result/result.dart';
import 'package:ticketorium_app_project/domain/usecases/get_movie_detail/get_movie_detail_param.dart';
import 'package:ticketorium_app_project/domain/usecases/usecase.dart';

class GetMovieDetail implements UseCase<Result<MovieDetail>, GetMovieDetailParam> {
  final MovieRepository _movieRepository;

  GetMovieDetail({
    required MovieRepository movieRepository}) 
    : _movieRepository = movieRepository;

  @override
  Future<Result<MovieDetail>> call(GetMovieDetailParam params) async {
    var movieDetailResult = await _movieRepository.getDetail(id: params.movie.id);

    return switch(movieDetailResult){
      Success(value: final movieDetail) => Result.success(movieDetail),
      Failed(:final message) => Result.failed(message)
    };
  }
}