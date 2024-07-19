import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/data/firebase/firebase_transaction_repository.dart';
import 'package:ticketorium_app_project/data/repositories/transaction_repository.dart';

part 'transaction_repository_provider.g.dart';

@riverpod
TransactionRepository transactionRepository(TransactionRepositoryRef ref) => FirebaseTransactionRepository();