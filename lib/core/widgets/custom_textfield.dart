import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/functions/extensions.dart';
import 'package:masar_app/core/styles/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.title,
    required this.hintText,
    this.prefixIcon,
    this.validator,
    this.controller,
    this.maxLines = 1,
  });

  final TextEditingController? controller;
  final String? title;
  final String hintText;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;
  final int maxLines;

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
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          minLines: 1,
          decoration: InputDecoration(prefixIcon: prefixIcon, hintText: hintText),
          validator: validator,
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        ),
      ],
    );
  }
}
