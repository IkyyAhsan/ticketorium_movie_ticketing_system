
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/data/firebase/firebase_user_repository.dart';
import 'package:ticketorium_app_project/data/repositories/user_repository.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) => FirebaseUserRepository();