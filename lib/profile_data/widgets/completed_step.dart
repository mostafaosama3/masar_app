import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:masar_app/core/constants/app_images.dart';
import 'package:masar_app/core/styles/text_styles.dart';
import 'package:masar_app/core/widgets/main_button.dart';

class CompletedStep extends StatelessWidget {
  const CompletedStep({
    super.key,
    required this.onGoHome,
  });

  final VoidCallback onGoHome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Lottie.asset(
              AppImages.success,
              height: 400,
            ),
            const Gap(15),
            Text(
              'Profile Completed',
              style: TextStyles.headline2.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(8),
            const Text(
              'Your profile has been successfully set up.\n'
              'You can now explore bootcamps and more.',
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            MainButton(
              title: 'Go To Home',
              ontap: onGoHome,
            ),
          ],
        ),
      ),
    );
  }
}
