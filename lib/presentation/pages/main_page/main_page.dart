import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketorium_app_project/domain/entities/user/user.dart';
import 'package:ticketorium_app_project/presentation/extentions/build_context_extention.dart';
import 'package:ticketorium_app_project/presentation/pages/movie_page/movie_page.dart';
import 'package:ticketorium_app_project/presentation/pages/profile_page/profile_page.dart';
import 'package:ticketorium_app_project/presentation/pages/ticket_page/ticket_page.dart';
import 'package:ticketorium_app_project/presentation/providers/router/router_provider.dart';
import 'package:ticketorium_app_project/presentation/providers/user_data/user_data_provider/user_data_provider.dart';
import 'package:ticketorium_app_project/presentation/widgets/bottom_nav_bar.dart';
import 'package:ticketorium_app_project/presentation/widgets/bottom_nav_bar_item.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({
    this.imageFile, 
    super.key,
  });

  final File? imageFile;

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
PageController pageController = PageController();
int selectedPage = 0;

@override
  void initState() {
    super.initState();

    User? user = ref.read(userDataProvider).valueOrNull;

    if(widget.imageFile != null && user != null){
      ref.read(userDataProvider.notifier).uploadProfilePicture(
        user: user, 
        imageFile: widget.imageFile!
      );
    }
  }

@override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (previous, next){
      if(previous != null && next is AsyncData && next.value == null){
        ref.read(routerProvider).goNamed('login');
      }else if(next is AsyncError){
        context.showSnackBar(next.error.toString());
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) => setState(() {
              selectedPage = value;
            }),
            children: const [
              Center(
                child: MoviePage(),
              ),
              Center(
                child: TicketPage()
              ),
              Center(
                child: ProfilePage(),
              ),
            ],
          ),
          BottomNavBar(
            items: [
              BottomNavBarItem(index: 0, isSelected: selectedPage == 0, title: 'Home', image: 'assets/images/movie.png', selectedImage: 'assets/images/movie-selected.png'),
              BottomNavBarItem(index: 1, isSelected: selectedPage == 1, title: 'Ticket', image: 'assets/images/ticket.png', selectedImage: 'assets/images/ticket-selected.png'),
              BottomNavBarItem(index: 2, isSelected: selectedPage == 2, title: 'Profile', image: 'assets/images/profile.png', selectedImage: 'assets/images/profile-selected.png'),
            ], 
          onTap: (index) {
            selectedPage = index;

            pageController.animateToPage(selectedPage, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
          }, 
          selectedIndex: 0
          )
        ],
      ),
    );
  }
}