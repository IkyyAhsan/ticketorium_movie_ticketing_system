import 'package:flutter/material.dart';
import 'package:ticketorium_app_project/presentation/misc/constant.dart';

class TicketoriumTextField extends StatelessWidget {
  const TicketoriumTextField({
    super.key, 
    required this.labelText, 
    required this.controller, 
    this.obsecureText = false,
    });

    final String labelText;
    final TextEditingController controller;
    final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: ghostWhite),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade800
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ghostWhite
          )
        )
      ),
    );
  }
}