import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/constants/app_images.dart';
import 'package:masar_app/core/styles/text_styles.dart';
import 'package:masar_app/core/widgets/main_button.dart';
import 'package:masar_app/profile_data/widgets/profile_shared_widgets.dart';

class PortfolioStep extends StatelessWidget {
  const PortfolioStep({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: .start,
        children: [

          Image.asset(AppImages.protfolieInfo,height: 200,),

          Center(child: Text("Portfolio & Additional Info",style: TextStyles.title1,)),
          const Gap(10),
           Center(child: Text("Share your work and achievements",style: TextStyles.body1,)),
          const Gap(15),
          const ProfileFieldLabel('Portfolio Links', optional: true),
          TextField(
            keyboardType: TextInputType.url,
            decoration: profileFieldDecoration(
              context,
              'https://github.com/username',
              icon: Icons.link,
            ),
          ),
          const Gap(10),
          const ProfileFieldLabel('Certificates', optional: true),
          InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () {},
            child: Container(
              height: 150,
              width: .maxFinite,
              decoration: BoxDecoration(
                color: scheme.surfaceContainerHighest.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_upload_outlined, size: 36),
                  SizedBox(height: 8),
                  Text('Upload Certificates'),
                ],
              ),
            ),
          ),
         Spacer(),
         MainButton(title: "Complete Profile", ontap: onNext),
        ],
            ),
      )
    );
  }
}
