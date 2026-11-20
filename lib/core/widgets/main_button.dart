import 'package:flutter/material.dart';
import 'package:masar_app/core/styles/text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.title, required this.ontap});

  final String title;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      child: Text(title, style: TextStyles.button),
    );
  }
}