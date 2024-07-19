import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/domain/usecases/get_transactions/get_transactions.dart';
import 'package:ticketorium_app_project/presentation/providers/repositories/transaction_repository/transaction_repository_provider.dart';

part 'get_transaction_provider.g.dart';

@riverpod
GetTransactions getTransactions(GetTransactionsRef ref) => GetTransactions(transactionRepository: ref.watch(transactionRepositoryProvider));