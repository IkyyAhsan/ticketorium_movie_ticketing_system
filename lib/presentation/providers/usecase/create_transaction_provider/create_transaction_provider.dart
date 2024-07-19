import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/domain/usecases/create_transaction/create_transaction.dart';
import 'package:ticketorium_app_project/presentation/providers/repositories/transaction_repository/transaction_repository_provider.dart';

part 'create_transaction_provider.g.dart';

@riverpod
CreateTransaction createTransaction(CreateTransactionRef ref) => CreateTransaction(transactionRepository: ref.watch(transactionRepositoryProvider));