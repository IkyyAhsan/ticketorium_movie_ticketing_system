import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ticketorium_app_project/domain/entities/result/result.dart';
import 'package:ticketorium_app_project/domain/entities/transaction/transaction.dart';
import 'package:ticketorium_app_project/domain/entities/user/user.dart';
import 'package:ticketorium_app_project/domain/usecases/get_transactions/get_transactions.dart';
import 'package:ticketorium_app_project/domain/usecases/get_transactions/get_transactions_param.dart';
import 'package:ticketorium_app_project/presentation/providers/usecase/get_transaction_provider/get_transaction_provider.dart';
import 'package:ticketorium_app_project/presentation/providers/user_data/user_data_provider/user_data_provider.dart';

part 'transaction_data_provider.g.dart';

@Riverpod(keepAlive: true)
class TransactionData extends _$TransactionData{
  @override
  Future<List<Transaction>> build() async {
    User? user = ref.read(userDataProvider).valueOrNull;

    if(user != null){
      state = const AsyncLoading();

      GetTransactions getTransactions = ref.read(getTransactionsProvider);

      var result = await getTransactions(GetTransactionsParam(uid: user.uid));

      if(result case Success(value: final transactions)){
        return transactions;
      }
    }
    return const [];
  }

  Future<void> refreshTransactionData() async {
    User? user = ref.read(userDataProvider).valueOrNull;

    if(user != null){
      state = const AsyncLoading();

      GetTransactions getTransactions = ref.read(getTransactionsProvider);

      var result = await getTransactions(GetTransactionsParam(uid: user.uid));

      switch(result){
        case Success(value: final transactions):
        state = AsyncData(transactions);
        case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = AsyncData(state.valueOrNull ?? const []);
      }
    }
  }
}