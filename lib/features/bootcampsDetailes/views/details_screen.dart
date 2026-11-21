import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/styles/themed_background.dart';

import '../../../core/constants/app_images.dart';
import '../model/bootcamp_model.dart';
import '../widgets/details/details_header.dart';
import '../widgets/details/details_state.dart';
import '../widgets/details/overview_card.dart';

class BootcampDetailsScreen extends StatefulWidget {
  const BootcampDetailsScreen({
    super.key,
    required this.bootcamp,
    this.description = 'Hands-on intensive training covering architecture, real-world workflows, and practical code reviews.',
    this.onManageTap,
  });

  final BootcampModel bootcamp;
  final String description;
  final VoidCallback? onManageTap;

  @override
  State<BootcampDetailsScreen> createState() => _BootcampDetailsScreenState();
}

class _BootcampDetailsScreenState extends State<BootcampDetailsScreen> {
  bool _showDetails = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() => _showDetails = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemedScreenBackground(
      lightAsset: AppImages.lightBackground,
      darkAsset: AppImages.darkBackGround,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          padding: const EdgeInsets.only(bottom: 28),
          children: [
            BootcampDetailsHeader(bootcamp: widget.bootcamp),
            const Gap(18),
            AnimatedSlide(
              offset: _showDetails ? Offset.zero : const Offset(0, 0.08),
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOutCubic,
              child: AnimatedOpacity(
                opacity: _showDetails ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      BootcampDetailsStats(bootcamp: widget.bootcamp),
                      const Gap(18),
                      BootcampDetailsOverviewCard(
                        progress: widget.bootcamp.progress,
                        description: widget.description,
                      ),
                      const Gap(30),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: widget.onManageTap ?? () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: LightPalette.secondaryColor,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  side: const BorderSide(
                                    color: LightPalette.primaryColor,
                                    width: 1.2,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Manage Bootcamp',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary,
                                ),
                              ),
                            ),
                          ),
                          const Gap(10),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: LightPalette.greyColor,
                              foregroundColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimary,
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                                width: 1.2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Icon(Icons.share_outlined),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
