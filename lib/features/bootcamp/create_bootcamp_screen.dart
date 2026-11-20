import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';

part 'bootcamp_constants.dart';
part 'bootcamp_steps.dart';
part 'bootcamp_fields.dart';
part 'bootcamp_shared_widgets.dart';

class CreateBootcampScreen extends StatefulWidget {
  const CreateBootcampScreen({super.key});

  @override
  State<CreateBootcampScreen> createState() => _CreateBootcampScreenState();
}

class _CreateBootcampScreenState extends State<CreateBootcampScreen>
    with _BootcampSteps, _BootcampFields {
  final _detailsFormKey = GlobalKey<FormState>();

  final _title = TextEditingController(
    text: 'Advanced React & Next.js',
  );

  final _description = TextEditingController(
    text: 'Build scalable web applications with React, Next.js, and modern frontend practices.',
  );

  final _skills = TextEditingController(
    text: 'React, Next.js, TypeScript',
  );

  final _capacity = TextEditingController(text: '50');

  int _step = 0;

  String _track = _tracks[0];
  String _level = _levels[1];
  String _mode = _modes[0];
  String _instructor = _instructors[0];
  String _timezone = _timezones[0];

  DateTime _start = DateTime(2026, 4, 20);
  DateTime _end = DateTime(2026, 6, 20);
  DateTime _deadline = DateTime(2026, 4, 18);

  TimeOfDay _startTime = const TimeOfDay(hour: 16, minute: 0);
  TimeOfDay _endTime = const TimeOfDay(hour: 17, minute: 30);

  final Set<String> _days = {
    'Monday',
    'Wednesday',
    'Saturday',
  };

  // ───────────────────────────── Lifecycle ─────────────────────────────

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _skills.dispose();
    _capacity.dispose();
    super.dispose();
  }

  // ───────────────────────────── Actions ─────────────────────────────

  @override
  Future<void> _pickDate(
    DateTime current,
    ValueChanged<DateTime> onPicked,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: current,
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (picked != null && mounted) {
      setState(() => onPicked(picked));
    }
  }

  @override
  Future<void> _pickTime(
    TimeOfDay current,
    ValueChanged<TimeOfDay> onPicked,
  ) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: current,
    );

    if (picked != null && mounted) {
      setState(() => onPicked(picked));
    }
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  void _continue() {
    if (_step == 0 && !_detailsFormKey.currentState!.validate()) {
      return;
    }

    if (_step == 1 && (_days.isEmpty || !_end.isAfter(_start))) {
      _showMessage(
        'Choose session days and make sure the end date is after the start date.',
      );
      return;
    }

    setState(() => _step++);
  }

  void _publish() {
    _showMessage('Bootcamp published successfully!');
    Navigator.of(context).pop();
  }

  // ───────────────────────────── Layout ─────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'CREATE BOOTCAMP',
          style: TextStyle(
            fontSize: 11,
            letterSpacing: .4,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
                children: [
                  Text(
                    _stepTitles[_step],
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Gap(24),
                  _stepper(),
                  const Gap(18),
                  Text(
                    'STEP ${_step + 1} OF 3',
                    style: const TextStyle(
                      fontSize: 9,
                      color: LightPalette.greyColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Gap(14),
                  switch (_step) {
                    0 => _detailsStep(),
                    1 => _scheduleStep(),
                    _ => _reviewStep(),
                  },
                ],
              ),
            ),
            _bottomBar(),
          ],
        ),
      ),
    );
  }

  // ───────────────────────────── Bottom Bar ─────────────────────────────

  Widget _bottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      color: Colors.white,
      child: Row(
        children: [
          if (_step > 0) ...[
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  setState(() => _step--);
                },
                child: const Text('Back'),
              ),
            ),
            const Gap(9),
          ],
          Expanded(
            child: FilledButton(
              onPressed: _step == 2 ? _publish : _continue,
              child: Text(
                _step == 2 ? 'Publish bootcamp' : 'Continue',
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────────────────── Stepper ─────────────────────────────

  Widget _stepper() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: _tint,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          for (var i = 0; i < _stepNames.length; i++)
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: i == _step
                      ? LightPalette.secondaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Text(
                  '${i + 1} · ${_stepNames[i]}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    color: i == _step
                        ? Colors.white
                        : LightPalette.greyColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}