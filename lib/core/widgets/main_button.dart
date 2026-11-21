import 'package:flutter/material.dart';
import 'package:masar_app/core/functions/extensions.dart';
import 'package:masar_app/core/styles/text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    required this.ontap,
    this.width = double.infinity,
    this.height = 50,
  });

  final String title;
  final VoidCallback ontap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: ontap,
    style: ElevatedButton.styleFrom(
      backgroundColor: context.theme.primaryColor,
      minimumSize: Size(width, height),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    child: Text(title, style: TextStyles.subtitle.copyWith(color: Colors.white)),
  );
}
