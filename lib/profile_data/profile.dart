import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/profile_data/widgets/academic_info_step.dart';
import 'package:masar_app/profile_data/widgets/completed_step.dart';
import 'package:masar_app/profile_data/widgets/personal_info_step.dart';
import 'package:masar_app/profile_data/widgets/portfolio_step.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key, required this.onGoHome});

  final VoidCallback onGoHome;

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _controller = PageController();
  int _step = 0;

  void _goTo(int step) {
    setState(() => _step = step);
    _controller.animateToPage(
      step,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _back() {
    if (_step == 0) {
      Navigator.maybePop(context);
    } else {
      _goTo(_step - 1);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDone = _step == 3;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 20, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: _back,
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const Gap(10),
                  if (!isDone) ...[
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: (_step + 1) / 3,
                          minHeight: 6,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text('${_step + 1} of 3'),
                  ],
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  PersonalInfoStep(onNext: () => _goTo(1)),
                  AcademicInfoStep(onNext: () => _goTo(2)),
                  PortfolioStep(onNext: () => _goTo(3)),
                  CompletedStep(onGoHome: widget.onGoHome),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
