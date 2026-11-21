import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/functions/extensions.dart';
import 'package:masar_app/core/styles/text_styles.dart';

import '../styles/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.title,
    required this.hintText,
    this.prefixIcon,
    this.validator,
    this.controller,
    this.maxLines = 1,
    this.postfixIcon,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? title;
  final String hintText;
  final Icon? prefixIcon;
  final Icon? postfixIcon;
  final String? Function(String?)? validator;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title case final label?) ...[
          Text(
            label,
            style: TextStyles.caption1.copyWith(
              fontWeight: FontWeight.w500,
              color: context.colorScheme.tertiary,
            ),
          ),
          const Gap(8),
        ],
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(14),

          ),
          child: TextFormField(
            validator: validator,
            controller: controller,
            maxLines: maxLines,
            onChanged: onChanged,
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: postfixIcon,
              hintText: hintText,
              filled: true,
              hintStyle: TextStyles.body2.copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              fillColor: context.colorScheme.surface,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: context.colorScheme.primary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
