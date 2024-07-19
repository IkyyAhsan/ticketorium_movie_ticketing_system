import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ticketorium_app_project/domain/entities/movie_detail/movie_detail.dart';
import 'package:ticketorium_app_project/domain/entities/result/result.dart';
import 'package:ticketorium_app_project/domain/entities/transaction/transaction.dart';
import 'package:ticketorium_app_project/domain/usecases/create_transaction/create_transaction.dart';
import 'package:ticketorium_app_project/domain/usecases/create_transaction/create_transaction_param.dart';
import 'package:ticketorium_app_project/presentation/extentions/build_context_extention.dart';
import 'package:ticketorium_app_project/presentation/extentions/int_extention.dart';
import 'package:ticketorium_app_project/presentation/misc/constant.dart';
import 'package:ticketorium_app_project/presentation/misc/methods.dart';
import 'package:ticketorium_app_project/presentation/pages/booking_confirmation_page/methods/transaction_row.dart';
import 'package:ticketorium_app_project/presentation/providers/router/router_provider.dart';
import 'package:ticketorium_app_project/presentation/providers/transaction_data/transaction_data_provider.dart';
import 'package:ticketorium_app_project/presentation/providers/usecase/create_transaction_provider/create_transaction_provider.dart';
import 'package:ticketorium_app_project/presentation/providers/user_data/user_data_provider/user_data_provider.dart';
import 'package:ticketorium_app_project/presentation/widgets/back_navigation_bar.dart';
import 'package:ticketorium_app_project/presentation/widgets/network_image_card.dart';

class BookingConfirmationPage extends ConsumerWidget {
  const BookingConfirmationPage
  ({ 
    required this.transactionDetail,
    super.key,
  });

  final (MovieDetail, Transaction) transactionDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var (movieDetail, transaction) = transactionDetail;

    transaction = transaction.copyWith(
      total: transaction.ticketAmount! * transaction.ticketPrice! + transaction.adminFee
    );

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
            child: Column(
              children: [
                BackNavigationBar(
                  "Booking Confirmation",
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(24),
                NetworkImageCard(
                  width: MediaQuery.of(context).size.width - 48,
                  height: (MediaQuery.of(context).size.width - 48) * 0.6,
                  borderRadius: 15,
                  imageUrl: 'https://image.tmdb.org/t/p/w500${movieDetail.backdropPath ?? movieDetail.posterPath}',
                  fit: BoxFit.cover,
                ),
                verticalSpace(24),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 48,
                  child: Text(
                    transaction.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                verticalSpace(5),
                const Divider(color: ghostWhite,),
                verticalSpace(5),
                transactionRow(
                  title: 'Showing Date', value: DateFormat('EEEE, d MMMM y').format(DateTime.fromMillisecondsSinceEpoch(transaction.watchingTime ?? 0)), 
                  width: MediaQuery.of(context).size.width - 48
                ),
                transactionRow(
                  title: 'Theater', 
                  value: '${transaction.theaterName}', 
                  width: MediaQuery.of(context).size.width - 48
                ),
                transactionRow(
                  title: 'Seat Numbers', 
                  value: transaction.seats.join(', '), 
                  width: MediaQuery.of(context).size.width - 48
                ),
                transactionRow(
                  title: '# of Tickets', 
                  value: '${transaction.ticketAmount} ticket(s)', 
                  width: MediaQuery.of(context).size.width - 48
                ),
                transactionRow(
                  title: 'Ticket Price', 
                  value: '${transaction.ticketPrice?.toIDRCurrencyFormat()}', 
                  width: MediaQuery.of(context).size.width - 48
                ),
                transactionRow(
                  title: 'Adm. Fee', 
                  value: transaction.adminFee.toIDRCurrencyFormat(), 
                  width: MediaQuery.of(context).size.width - 48
                ),
                const Divider(color: ghostWhite,),
                transactionRow(
                  title: 'Total Price', 
                  value: transaction.total.toIDRCurrencyFormat(), 
                  width: MediaQuery.of(context).size.width - 48
                ),
                verticalSpace(40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      int transactiontime = DateTime.now().millisecondsSinceEpoch;

                      transaction = transaction.copyWith(
                        transactionTime: transactiontime,
                        id: 'tcr-$transactiontime-${transaction.uid}'
                      );

                      CreateTransaction createTransaction = ref.read(createTransactionProvider);

                      await createTransaction(CreateTransactionParam(transaction: transaction)).then(
                        (result) {
                          switch(result){
                            case Success(value: _) : ref.read(transactionDataProvider.notifier)
                              .refreshTransactionData();
                              ref.read(userDataProvider.notifier).refreshUserData();
                              ref.read(routerProvider).pushReplacement('/main');
                            case Failed(:final message): 
                              context.showSnackBar(message);
                          }
                        });
                    }, 
                    style: ElevatedButton.styleFrom(
                      foregroundColor: backgroundColor,
                      backgroundColor: saffron,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: Text("Pay Now")),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}