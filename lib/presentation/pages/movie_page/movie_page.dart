import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticketorium_app_project/presentation/misc/methods.dart';
import 'package:ticketorium_app_project/presentation/pages/movie_page/methods/movie_list.dart';
import 'package:ticketorium_app_project/presentation/pages/movie_page/methods/search_bar.dart';
import 'package:ticketorium_app_project/presentation/providers/movie/now_playing_provider/now_playing_provider.dart';
import 'package:ticketorium_app_project/presentation/providers/movie/upcoming_provider/upcoming_provider.dart';
import 'package:ticketorium_app_project/presentation/providers/router/router_provider.dart';
import 'methods/promotion_list.dart';
import 'methods/user_info.dart';

class MoviePage extends ConsumerWidget {
  const MoviePage({
    super.key,
    });

    final List<String> promotionImageFileNames = const [
      'popcorn',
      'buy1get1',
    ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userInfo(ref),
            verticalSpace(40),
            searchBar(context),
            verticalSpace(24),
            ...movieList(
              title: "Now Playing", 
              movies: ref.watch(nowPlayingProvider),
              onTap: (movie){
                ref.read(routerProvider).pushNamed('detail', extra: movie);
              }
            ),
            verticalSpace(30),
            ...promotionList(promotionImageFileNames),
            verticalSpace(30),
            ...movieList(
              title: "Upcoming", 
              movies: ref.watch(upcomingProvider)
            ),
            verticalSpace(100)
          ],
        )
      ],
    );
  }
}