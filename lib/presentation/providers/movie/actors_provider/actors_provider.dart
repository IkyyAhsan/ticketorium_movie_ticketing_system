import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/domain/entities/actor/actor.dart';
import 'package:ticketorium_app_project/domain/entities/result/result.dart';
import 'package:ticketorium_app_project/domain/usecases/get_actors/get_actors.dart';
import 'package:ticketorium_app_project/domain/usecases/get_actors/get_actors_param.dart';
import 'package:ticketorium_app_project/presentation/providers/usecase/get_actors_provider/get_actors_provider.dart';

part 'actors_provider.g.dart';

@riverpod
Future<List<Actor>> actors(ActorsRef ref, {required int movieId}) async {
  GetActors getActors = ref.read(getActorsProvider);

  var actorsResult = await getActors(GetActorsParam(movieId: movieId));

  return switch(actorsResult){
    Success(value: final actors) => actors,
    Failed(message: _) => const []
  };
}