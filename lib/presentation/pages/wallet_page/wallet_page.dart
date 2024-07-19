import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketorium_app_project/presentation/misc/methods.dart';
import 'package:ticketorium_app_project/presentation/pages/wallet_page/methods/recent_transactions.dart';
import 'package:ticketorium_app_project/presentation/pages/wallet_page/methods/wallet_card.dart';
import 'package:ticketorium_app_project/presentation/providers/router/router_provider.dart';
import 'package:ticketorium_app_project/presentation/widgets/back_navigation_bar.dart';

class WalletPage extends ConsumerWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Column(
              children: [
                BackNavigationBar(
                  'My Wallet', onTap: () => 
                  ref.read(routerProvider).pop(),
                ),
                verticalSpace(24),
                walletCard(ref),
                verticalSpace(24),
                ...recentTransactions(ref),
              ],
            ),
          )
        ],
      ),
    );
  }
}