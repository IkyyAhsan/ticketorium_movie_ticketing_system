import 'package:flutter/material.dart';
import 'package:ticketorium_app_project/presentation/misc/constant.dart';

class SelectableCard extends StatelessWidget {
  const SelectableCard({
    super.key, 
    required this.text, 
    this.onTap, 
    this.isSelected = false, 
    this.isEnable = true,
  });

  final String text;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnable ? onTap : null,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? saffron.withOpacity(0.3) : null,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isEnable ? saffron : Colors.grey
          ),
        ),
        child: Center(
          child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, color: isEnable ? ghostWhite : Colors.grey),),
        ),
      ));
  }
}