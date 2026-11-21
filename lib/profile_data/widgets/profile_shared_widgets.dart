import 'package:flutter/material.dart';

class ProfileStepHeader extends StatelessWidget {
  const ProfileStepHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Column(
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            color: scheme.primary.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 64, color: scheme.primary),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: text.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        Text(subtitle, textAlign: TextAlign.center, style: text.bodyMedium),
        const SizedBox(height: 24),
      ],
    );
  }
}

class ProfilePrimaryButton extends StatelessWidget {
  const ProfilePrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class ProfileFieldLabel extends StatelessWidget {
  const ProfileFieldLabel(this.label, {super.key, this.optional = false});

  final String label;
  final bool optional;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 12),
      child: Text.rich(
        TextSpan(
          text: label,
          style: const TextStyle(fontWeight: FontWeight.w700),
          children: [
            if (optional)
              TextSpan(
                text: ' (Optional)',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).hintColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

InputDecoration profileFieldDecoration(
  BuildContext context,
  String hint, {
  IconData? icon,
}) {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(14),
    borderSide: BorderSide(color: Theme.of(context).dividerColor),
  );

  return InputDecoration(
    hintText: hint,
    prefixIcon: icon == null ? null : Icon(icon),
    border: border,
    enabledBorder: border,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
  );
}
