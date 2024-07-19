import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/domain/usecases/register_usecase/register.dart';
import 'package:ticketorium_app_project/presentation/providers/repositories/authentication/authentication_provider.dart';
import 'package:ticketorium_app_project/presentation/providers/repositories/user_repository/user_repository_provider.dart';

part 'register_provider.g.dart';

@riverpod
Register register(RegisterRef ref) => Register(authentication: ref.watch(authenticationProvider), userRepository: ref.watch(userRepositoryProvider));