import 'package:ticketorium_app_project/data/repositories/transaction_repository.dart';
import 'package:ticketorium_app_project/domain/entities/result/result.dart';
import 'package:ticketorium_app_project/domain/entities/transaction/transaction.dart';
import 'package:ticketorium_app_project/domain/usecases/get_transactions/get_transactions_param.dart';
import 'package:ticketorium_app_project/domain/usecases/usecase.dart';

class GetTransactions implements UseCase<Result<List<Transaction>>, GetTransactionsParam> {
  final TransactionRepository _transactionRepository;

  GetTransactions({
    required TransactionRepository transactionRepository}) 
    : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<Transaction>>> call(GetTransactionsParam params) async {
    var transactionListResult = await _transactionRepository.getUserTransaction(uid: params.uid);

    return switch (transactionListResult) {
      Success(value: final transactionList) => Result.success(transactionList),
      Failed(:final message) => Result.failed(message)
    };
  }

}