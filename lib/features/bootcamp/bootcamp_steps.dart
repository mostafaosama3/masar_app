part of 'create_bootcamp_screen.dart';

mixin _BootcampSteps on State<CreateBootcampScreen> {
  GlobalKey<FormState> get _detailsFormKey;

  TextEditingController get _title;
  TextEditingController get _description;
  TextEditingController get _skills;
  TextEditingController get _capacity;

  String get _track;
  set _track(String value);

  String get _level;
  set _level(String value);

  String get _mode;
  set _mode(String value);

  String get _instructor;
  set _instructor(String value);

  String get _timezone;
  set _timezone(String value);

  DateTime get _start;
  set _start(DateTime value);

  DateTime get _end;
  set _end(DateTime value);

  DateTime get _deadline;
  set _deadline(DateTime value);

  TimeOfDay get _startTime;
  set _startTime(TimeOfDay value);

  TimeOfDay get _endTime;
  set _endTime(TimeOfDay value);

  Set<String> get _days;

  Future<void> _pickDate(
    DateTime current,
    ValueChanged<DateTime> onPicked,
  );

  Future<void> _pickTime(
    TimeOfDay current,
    ValueChanged<TimeOfDay> onPicked,
  );

  Widget _textField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    TextInputType? keyboard,
    String? Function(String?)? validator,
  });

  Widget _dropdown(
    String label,
    String value,
    List<String> items,
    ValueChanged<String> onChanged,
  );

  Widget _reviewHeader(String title);

  // ───────────────────────────── Steps ─────────────────────────────

  Widget _detailsStep() {
    return Form(
      key: _detailsFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _StepIntro(
            'Set up your program',
            'Give trainees a clear picture of what they’ll learn.',
          ),

          _textField(
            'Bootcamp title *',
            _title,
            validator: _required,
          ),

          _dropdown(
            'Learning track *',
            _track,
            _tracks,
            (v) => _track = v,
          ),

          _dropdown(
            'Experience level *',
            _level,
            _levels,
            (v) => _level = v,
          ),

          _textField(
            'Description *',
            _description,
            maxLines: 3,
            validator: _required,
          ),

          _textField(
            'Skills trainees will learn',
            _skills,
          ),

          _textField(
            'Maximum trainees *',
            _capacity,
            keyboard: TextInputType.number,
            validator: _validCapacity,
          ),

          const Gap(8),

          const _Notice(
            'Your bootcamp is saved as a draft until you publish it.',
          ),
        ],
      ),
    );
  }

  // ───────────────────────────── Schedule Step ─────────────────────────────

  Widget _scheduleStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'When will learning happen?',
          style: _introTitle,
        ),

        const Gap(15),

        Row(
          children: [
            Expanded(
              child: _PickerField(
                'Start date *',
                _formatDate(_start),
                Icons.calendar_today_outlined,
                () => _pickDate(
                  _start,
                  (d) => _start = d,
                ),
              ),
            ),

            const Gap(9),

            Expanded(
              child: _PickerField(
                'End date *',
                _formatDate(_end),
                Icons.calendar_today_outlined,
                () => _pickDate(
                  _end,
                  (d) => _end = d,
                ),
              ),
            ),
          ],
        ),

        _dropdown(
          'Delivery mode *',
          _mode,
          _modes,
          (v) => _mode = v,
        ),

        const _Label('Session days *'),

        Wrap(
          spacing: 6,
          runSpacing: 2,
          children: [
            for (final day in _weekDays)
              FilterChip(
                label: Text(
                  day.substring(0, 3),
                  style: const TextStyle(fontSize: 10),
                ),
                selected: _days.contains(day),
                onSelected: (on) {
                  setState(() {
                    if (on) {
                      _days.add(day);
                    } else {
                      _days.remove(day);
                    }
                  });
                },
              ),
          ],
        ),

        Row(
          children: [
            Expanded(
              child: _PickerField(
                'Start time *',
                _startTime.format(context),
                Icons.access_time,
                () => _pickTime(
                  _startTime,
                  (t) => _startTime = t,
                ),
              ),
            ),

            const Gap(9),

            Expanded(
              child: _PickerField(
                'End time *',
                _endTime.format(context),
                Icons.access_time,
                () => _pickTime(
                  _endTime,
                  (t) => _endTime = t,
                ),
              ),
            ),
          ],
        ),

        _dropdown(
          'Time zone',
          _timezone,
          _timezones,
          (v) => _timezone = v,
        ),

        _dropdown(
          'Lead instructor *',
          _instructor,
          _instructors,
          (v) => _instructor = v,
        ),

        _PickerField(
          'Enrollment deadline',
          _formatDate(_deadline),
          Icons.calendar_today_outlined,
          () => _pickDate(
            _deadline,
            (d) => _deadline = d,
          ),
        ),

        const Gap(12),

        _Notice(
          '$_instructor is available for this schedule. No session conflicts found.',
        ),
      ],
    );
  }

  // ───────────────────────────── Review Step ─────────────────────────────

  Widget _reviewStep() {
    final weeks = _end.difference(_start).inDays ~/ 7;

    final dayNames = _days
        .map((d) => d.substring(0, 3))
        .join(', ');

    final times =
        '${_startTime.format(context)}–${_endTime.format(context)}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Notice(
          'Everything is ready. Review your program before publishing.',
        ),

        const Gap(14),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: LightPalette.secondaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _track.toUpperCase(),
                style: const TextStyle(
                  color: LightPalette.mint,
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const Gap(8),

              Text(
                _title.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const Gap(8),

              Text(
                '$_level · $_mode · ${_capacity.text} seats',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),

        const Gap(18),

        _reviewHeader('Program details'),

        _ReviewCard([
          (
            'Schedule',
            '${_formatDate(_start)}–${_formatDate(_end)} · $weeks weeks',
          ),
          (
            'Live sessions',
            '$dayNames · $times · $_timezone',
          ),
          (
            'Lead instructor',
            _instructor,
          ),
          (
            'Enrollment closes',
            _formatDate(_deadline),
          ),
        ]),

        const Gap(15),

        _reviewHeader('What trainees will learn'),

        _ReviewCard([
          ('Description', _description.text),
          ('Skills', _skills.text),
        ]),

        const Gap(12),

        const Text(
          'By publishing, this program becomes visible to trainees. '
          'You can still edit program details later.',
          style: TextStyle(
            color: LightPalette.greyColor,
            fontSize: 10,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}