
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/domain/usecases/login_usecase/login.dart';
import 'package:ticketorium_app_project/presentation/providers/repositories/authentication/authentication_provider.dart';
import 'package:ticketorium_app_project/presentation/providers/repositories/user_repository/user_repository_provider.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) => Login(authentication: ref.watch(authenticationProvider),
userRepository: ref.watch(userRepositoryProvider));