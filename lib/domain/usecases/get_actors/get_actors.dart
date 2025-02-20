import 'package:ticketorium_app_project/data/repositories/movie_repository.dart';
import 'package:ticketorium_app_project/domain/entities/actor/actor.dart';
import 'package:ticketorium_app_project/domain/entities/result/result.dart';
import 'package:ticketorium_app_project/domain/usecases/get_actors/get_actors_param.dart';
import 'package:ticketorium_app_project/domain/usecases/usecase.dart';

class GetActors implements UseCase<Result<List<Actor>>, GetActorsParam> {
  final MovieRepository _movieRepository;

  GetActors({
    required MovieRepository movieRepository}) 
    : _movieRepository = movieRepository;

  @override
  Future<Result<List<Actor>>> call(GetActorsParam params) async {
    var actorListResult = await _movieRepository.getActors(id: params.movieId);

    return switch (actorListResult){
      Success(value: final actorList) => Result.success(actorList),
      Failed(:final message) => Result.failed(message)
    };
  }
}