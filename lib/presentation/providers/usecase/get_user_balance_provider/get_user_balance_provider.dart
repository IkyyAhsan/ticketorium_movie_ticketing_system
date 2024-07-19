import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/domain/usecases/get_user_balance/get_user_balance.dart';
import 'package:ticketorium_app_project/presentation/providers/repositories/user_repository/user_repository_provider.dart';

part 'get_user_balance_provider.g.dart';

@riverpod
GetUserBalance getUserBalance(GetUserBalanceRef ref) => GetUserBalance(userRepository: ref.watch(userRepositoryProvider));