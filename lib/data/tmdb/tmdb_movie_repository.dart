import 'package:dio/dio.dart';
import 'package:ticketorium_app_project/data/repositories/movie_repository.dart';
import 'package:ticketorium_app_project/domain/entities/actor/actor.dart';
import 'package:ticketorium_app_project/domain/entities/movie/movie.dart';
import 'package:ticketorium_app_project/domain/entities/movie_detail/movie_detail.dart';
import 'package:ticketorium_app_project/domain/entities/result/result.dart';

class TmdbMovieRepository implements MovieRepository {
  final Dio? _dio;
  final String _accessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZDBkYzhiYTBjNWIwZDczMWFkZDc2MWQzODM2OTVjMiIsIm5iZiI6MTcyMDU5MzAyNS41ODczODUsInN1YiI6IjY2OGJjZWNmMmI1ZGU3MjM2MGVhZWJiNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.m0hgpyObLd9JK6Y4Boz2eoDNr4uyQ1DAFhV8nz1ViAA';
  
  late final Options _options = Options(headers: {
    'Authorization': 'Bearer $_accessToken',
    'accept': 'application/json',
  });
  TmdbMovieRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<List<Actor>>> getActors({required int id}) async {
    try {
      final response = await _dio!.get(
        'https://api.themoviedb.org/3/movie/$id/credits?language=en-US',
        options: _options
      );
      
      final results = List<Map<String, dynamic>>.from(response.data['cast']);

      return Result.success(results.map((e) => Actor.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<MovieDetail>> getDetail({required int id}) async {
    try {
      final response = await _dio!.get(
          'https://api.themoviedb.org/3/movie/$id?language=en-US',
          options: _options);

      return Result.success(MovieDetail.fromJSON(response.data));
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({int page = 1}) async =>
      _getMovies(_MovieCategory.nowPlaying.toString(), page: page);

  @override
  Future<Result<List<Movie>>> getUpcoming({int page = 1}) async =>
      _getMovies(_MovieCategory.upcoming.toString(), page: page);

  Future<Result<List<Movie>>> _getMovies(String category, {int page = 1}) async {
    try{
      final response = await _dio!.get(
        'https://api.themoviedb.org/3/movie/$category?language=en-US&page=$page',
        options: _options
      );

      final result = List<Map<String, dynamic>>.from(response.data['results']);

      return Result.success(result.map((e) => Movie.fromJSON(e)).toList());
    } on DioException catch(e) {
      return Result.failed('${e.message}');
    }
  }
}

enum _MovieCategory {
  nowPlaying('now_playing'),
  upcoming('upcoming');

  final String _instring;

  const _MovieCategory(String inString): _instring = inString;

  @override
  String toString() => _instring;
}