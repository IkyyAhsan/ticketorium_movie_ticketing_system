import '../../domain/entities/actor/actor.dart';
import '../../domain/entities/movie/movie.dart';
import '../../domain/entities/movie_detail/movie_detail.dart';
import '../../domain/entities/result/result.dart';

abstract interface class MovieRepository {
  Future<Result<List<Movie>>> getNowPlaying({int page = 1});
  Future<Result<List<Movie>>> getUpcoming({int page = 1});
  Future<Result<MovieDetail>> getDetail({required int id});
  Future<Result<List<Actor>>> getActors({required int id});
}