import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String title;
  final IconData? icon;
  final TextEditingController controller;
  const CustomField({super.key, required this.title, this.icon, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
        suffix: Icon(icon),
      ),
    );
  }
}
