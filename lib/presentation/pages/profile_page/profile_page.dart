import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketorium_app_project/presentation/misc/methods.dart';
import 'package:ticketorium_app_project/presentation/pages/profile_page/methods/profile_item.dart';
import 'package:ticketorium_app_project/presentation/pages/profile_page/methods/user_info.dart';
import 'package:ticketorium_app_project/presentation/providers/router/router_provider.dart';
import 'package:ticketorium_app_project/presentation/providers/user_data/user_data_provider/user_data_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Padding(padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            verticalSpace(20),
            ...userInfo(ref),
            verticalSpace(20),
            const Divider(),
            verticalSpace(20),
            profileItem("Update Profile"),
            verticalSpace(20),
            profileItem("My Wallet", onTap: () => ref.read(routerProvider).pushNamed('wallet'),),
            verticalSpace(20),
            profileItem("Change Password"),
            verticalSpace(20),
            profileItem("Change Language"),
            verticalSpace(20),
            const Divider(),
            verticalSpace(20),
            profileItem("Contact Us"),
            verticalSpace(20),
            profileItem("Privacy Policy"),
            verticalSpace(20),
            profileItem("Terms and Conditions"),
            verticalSpace(60),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  ref.read(userDataProvider.notifier).logout();
                }, 
                child: const Text("Logout")
              ),
            ),
            verticalSpace(20),
            const Text('Version 0.0.4', style: TextStyle(fontSize: 12),),
            verticalSpace(100),
          ],
        ),  
      ),
      ],
    );
  }
}