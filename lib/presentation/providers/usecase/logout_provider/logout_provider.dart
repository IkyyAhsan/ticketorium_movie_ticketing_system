import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/domain/usecases/logout_usecase/logout.dart';
import 'package:ticketorium_app_project/presentation/providers/repositories/authentication/authentication_provider.dart';

part 'logout_provider.g.dart';

@riverpod
Logout logout(LogoutRef ref) => Logout(authentication: ref.watch(authenticationProvider));