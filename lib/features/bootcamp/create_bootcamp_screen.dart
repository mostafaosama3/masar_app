import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/functions/toast.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/features/bootcamp/cubit/create_bootcamp_cubit.dart';
import 'package:masar_app/features/bootcamp/data/models/bootcamp_draft.dart';

part 'bootcamp_constants.dart';
part 'bootcamp_steps.dart';
part 'bootcamp_shared_widgets.dart';

class CreateBootcampScreen extends StatefulWidget {
  const CreateBootcampScreen({super.key});

  @override
  State<CreateBootcampScreen> createState() => _CreateBootcampScreenState();
}

class _CreateBootcampScreenState extends State<CreateBootcampScreen>
    with _BootcampSteps {
  @override
  final _detailsFormKey = GlobalKey<FormState>();

  @override
  final _scheduleFormKey = GlobalKey<FormState>();

  @override
  final _title = TextEditingController(
    text: 'Advanced React & Next.js',
  );

  @override
  final _description = TextEditingController(
    text: 'Build scalable web applications with React, Next.js, and modern frontend practices.',
  );

  @override
  final _skills = TextEditingController(
    text: 'React, Next.js, TypeScript',
  );

  @override
  final _capacity = TextEditingController(text: '50');

  int _step = 0;

  // The steps mixin declares these setters with a nullable parameter
  // (String? / DateTime? / TimeOfDay?), so each one is a getter + setter pair.
  String _trackValue = _tracks[0];
  @override
  String get _track => _trackValue;
  @override
  set _track(String? value) => _trackValue = value ?? _trackValue;

  String _levelValue = _levels[1];
  @override
  String get _level => _levelValue;
  @override
  set _level(String? value) => _levelValue = value ?? _levelValue;

  String _modeValue = _modes[0];
  @override
  String get _mode => _modeValue;
  @override
  set _mode(String? value) => _modeValue = value ?? _modeValue;

  String _instructorValue = _instructors[0];
  @override
  String get _instructor => _instructorValue;
  @override
  set _instructor(String? value) => _instructorValue = value ?? _instructorValue;

  @override
  String _timezone = _timezones[0];

  DateTime _startValue = DateTime(2026, 4, 20);
  @override
  DateTime get _start => _startValue;
  @override
  set _start(DateTime? value) => _startValue = value ?? _startValue;

  DateTime _endValue = DateTime(2026, 6, 20);
  @override
  DateTime get _end => _endValue;
  @override
  set _end(DateTime? value) => _endValue = value ?? _endValue;

  @override
  DateTime _deadline = DateTime(2026, 4, 18);

  TimeOfDay _startTimeValue = const TimeOfDay(hour: 16, minute: 0);
  @override
  TimeOfDay get _startTime => _startTimeValue;
  @override
  set _startTime(TimeOfDay? value) => _startTimeValue = value ?? _startTimeValue;

  TimeOfDay _endTimeValue = const TimeOfDay(hour: 17, minute: 30);
  @override
  TimeOfDay get _endTime => _endTimeValue;
  @override
  set _endTime(TimeOfDay? value) => _endTimeValue = value ?? _endTimeValue;

  @override
  final Set<String> _days = {
    'Monday',
    'Wednesday',
    'Saturday',
  };

  

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _skills.dispose();
    _capacity.dispose();
    super.dispose();
  }

  

  @override
  Future<void> _pickDate(
    DateTime? current,
    ValueChanged<DateTime> onPicked,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: current ?? DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (picked != null && mounted) {
      setState(() => onPicked(picked));
    }
  }

  @override
  Future<void> _pickTime(
    TimeOfDay? current,
    ValueChanged<TimeOfDay> onPicked,
  ) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: current ?? TimeOfDay.now(),
    );

    if (picked != null && mounted) {
      setState(() => onPicked(picked));
    }
  }

  @override
  Widget _reviewHeader(String title) {
    return Row(
      children: [
        Expanded(child: Text(title, style: _introTitle)),
        TextButton(
          onPressed: () => setState(() => _step = 0),
          child: const Text('Edit'),
        ),
      ],
    );
  }

  @override
  Widget _textField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    TextInputType? keyboard,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Label(label),
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            keyboardType: keyboard,
            validator: validator,
            style: const TextStyle(fontSize: 12),
            decoration: _fieldDecoration(vertical: 13),
          ),
        ),
      ],
    );
  }

  @override
  Widget _dropdown(
    String label,
    String? value,
    List<String> items,
    ValueChanged<String> onChanged, {
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Label(label),
        DropdownButtonFormField<String>(
          initialValue: value,
          isExpanded: true,
          validator: validator,
          hint: Text(
            'Select ${label.replaceAll(' *', '')}',
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
          items: [
            for (final item in items)
              DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
          onChanged: (v) {
            if (v != null) {
              setState(() => onChanged(v));
            }
          },
          decoration: _fieldDecoration(vertical: 3),
        ),
      ],
    );
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

    if (_step == 1 && !(_scheduleFormKey.currentState?.validate() ?? true)) {
      return;
    }

    if (_step == 1 && (_days.isEmpty || !_end.isAfter(_start))) {
      _showMessage(
        'Choose session days and make sure the end date is after the start date.',
      );
      return;
    }

    if (_step == 1 && _deadline.isAfter(_start)) {
      _showMessage('Enrollment must close on or before the start date.');
      return;
    }

    setState(() => _step++);
  }

  String _hhmm(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

  void _publish() {
    final draft = BootcampDraft(
      title: _title.text,
      description: _description.text,
      skills: BootcampDraft.parseSkills(_skills.text),
      capacity: int.parse(_capacity.text.trim()),
      track: _track,
      level: _level,
      mode: _mode,
      instructor: _instructor,
      timezone: _timezone,
      startDate: _start,
      endDate: _end,
      enrollmentDeadline: _deadline,
      startTime: _hhmm(_startTime),
      endTime: _hhmm(_endTime),
      // Keep the week order (Monday first), not the order they were tapped.
      days: [for (final d in _weekDays) if (_days.contains(d)) d],
    );

    context.read<CreateBootcampCubit>().submit(draft);
  }

  

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateBootcampCubit, CreateBootcampState>(
      listener: (context, state) {
        if (state is CreateBootcampSuccess) {
          _showMessage('Bootcamp published successfully!');
          Navigator.of(context).pop();
        } else if (state is CreateBootcampFailure) {
          showErrorDialog(context, state.message);
        }
      },
      child: Scaffold(
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
      ),
    );
  }

  

  Widget _bottomBar() {
    return BlocBuilder<CreateBootcampCubit, CreateBootcampState>(
      builder: (context, state) {
        final submitting = state is CreateBootcampSubmitting;

        return Container(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          color: Colors.white,
          child: Row(
            children: [
              if (_step > 0) ...[
                Expanded(
                  child: OutlinedButton(
                    onPressed: submitting
                        ? null
                        : () {
                            setState(() => _step--);
                          },
                    child: const Text('Back'),
                  ),
                ),
                const Gap(9),
              ],
              Expanded(
                child: FilledButton(
                  onPressed: submitting
                      ? null
                      : (_step == 2 ? _publish : _continue),
                  child: submitting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(
                          _step == 2 ? 'Publish bootcamp' : 'Continue',
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  

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