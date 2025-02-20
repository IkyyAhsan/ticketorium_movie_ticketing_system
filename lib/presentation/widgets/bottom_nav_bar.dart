import 'package:flutter/material.dart';
import 'package:ticketorium_app_project/presentation/widgets/bottom_nav_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key, 
    required this.items, 
    required this.onTap, 
    required this.selectedIndex
    });

    final List<BottomNavBarItem> items;
    final void Function(int index) onTap;
    final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: const Color.fromARGB(200, 12, 12, 17),
          borderRadius:  const BorderRadius.only(
            topLeft: Radius.circular(20), 
            topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, -5)
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: 
            items.map((e) => GestureDetector(
              onTap: () => onTap(e.index), 
              child: e,
            )).toList(),
        ),
      ),
    );
  }
}