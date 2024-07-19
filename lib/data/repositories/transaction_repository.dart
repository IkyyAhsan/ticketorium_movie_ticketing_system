import 'package:ticketorium_app_project/domain/entities/result/result.dart';
import 'package:ticketorium_app_project/domain/entities/transaction/transaction.dart';

abstract interface class TransactionRepository{
  Future<Result<Transaction>> createTransaction({required Transaction transaction});
  Future<Result<List<Transaction>>> getUserTransaction({required String uid});
}