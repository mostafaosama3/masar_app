import 'package:flutter/material.dart';
import 'package:masar_app/core/functions/extensions.dart';
import 'package:masar_app/core/styles/text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    required this.ontap,
  });

  final String title;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.theme.primaryColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        title,
        style: TextStyles.subtitle.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
