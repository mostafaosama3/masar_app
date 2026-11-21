import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/constants/app_images.dart';
import 'package:masar_app/core/widgets/custom_textfield.dart';
import 'package:masar_app/core/widgets/main_button.dart';

class PersonalInfoStep extends StatelessWidget {
  const PersonalInfoStep({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppImages.personalInfo, height: 300),
            const Gap(25),
            CustomTextField(
              hintText: "Enter your full name",
              prefixIcon: const Icon(Icons.person_outline),
            ),
            const Gap(28),
            CustomTextField(
              hintText: "Enter your email",
              prefixIcon: const Icon(Icons.email_outlined),
            ),

            const Gap(25),
            CustomTextField(
              hintText: "Enter your phone number",
              prefixIcon: const Icon(Icons.phone_outlined),
            ),

            Spacer(),
            MainButton(title: 'Next ', ontap: onNext),
          ],
        ),
      ),
    );
  }
}
