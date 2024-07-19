import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/domain/usecases/get_actors/get_actors.dart';
import 'package:ticketorium_app_project/presentation/providers/repositories/movie_repository/movie_repository_provider.dart';

part 'get_actors_provider.g.dart';

@riverpod
GetActors getActors(GetActorsRef ref) => GetActors(movieRepository: ref.watch(movieRepositoryProvider));