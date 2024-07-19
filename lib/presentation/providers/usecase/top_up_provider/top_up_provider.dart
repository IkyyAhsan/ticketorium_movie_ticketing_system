import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/domain/usecases/top_up/top_up.dart';
import 'package:ticketorium_app_project/presentation/providers/repositories/transaction_repository/transaction_repository_provider.dart';

part 'top_up_provider.g.dart';

@riverpod
TopUp topUp(TopUpRef ref) => TopUp(transactionRepository: ref.watch(transactionRepositoryProvider));