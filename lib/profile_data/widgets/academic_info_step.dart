import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/constants/app_images.dart';
import 'package:masar_app/core/styles/text_styles.dart';
import 'package:masar_app/core/widgets/main_button.dart';
import 'package:masar_app/profile_data/widgets/profile_shared_widgets.dart';

class AcademicInfoStep extends StatefulWidget {
  const AcademicInfoStep({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  State<AcademicInfoStep> createState() => _AcademicInfoStepState();
}

class _AcademicInfoStepState extends State<AcademicInfoStep> {
  static const _levels = ['0–1 years', '2–5 years', '5+ years'];

  // String _role = 'Instructor';
  String _level = _levels[1];
  final List<String> _skills = ['Flutter', 'Dart', 'Firebase'];

  Future<void> _addSkill() async {
    final controller = TextEditingController();
    final skill = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add Skill'),
        content: TextField(controller: controller, autofocus: true),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pop(dialogContext, controller.text.trim()),
            child: const Text('Add'),
          ),
        ],
      ),
    );
    controller.dispose();

    if (skill != null && skill.isNotEmpty && !_skills.contains(skill)) {
      setState(() => _skills.add(skill));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Image.asset(AppImages.academicInfo, height: 200),
            //
            //'Tell us more about your background'
            Center(
              child: Text(
                'Academic / Professional\nInformation',
                textAlign: TextAlign.center,
                style: TextStyles.title1.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const Gap(5),
            Center(
              child: Text(
                "Tell us more about your background",
                style: TextStyles.subtitle,
              ),
            ),
            const Gap(12),
            Text(
              "Experience Level",
              style: TextStyles.body1.copyWith(fontWeight: .w600),
            ),
            const Gap(5),
            DropdownButtonFormField<String>(
              initialValue: _level,
              decoration: profileFieldDecoration(context, ''),
              items: _levels
                  .map(
                    (level) =>
                        DropdownMenuItem(value: level, child: Text(level)),
                  )
                  .toList(),
              onChanged: (value) => setState(() => _level = value ?? _level),
            ),
            const ProfileFieldLabel('Skills', optional: true),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ..._skills.map(
                  (skill) => Chip(
                    label: Text(skill),
                    onDeleted: () => setState(() => _skills.remove(skill)),
                  ),
                ),
                ActionChip(
                  avatar: const Icon(Icons.add, size: 18),
                  label: const Text('Add Skill'),
                  onPressed: _addSkill,
                ),
              ],
            ),
            const ProfileFieldLabel('Bio', optional: true),
            TextField(
              maxLines: 3,
              decoration: profileFieldDecoration(
                context,
                'Tell us about yourself...',
              ),
            ),
            Spacer(),
            MainButton(title: "Next", ontap: widget.onNext),
          ],
        ),
      ),
    );
  }
}
