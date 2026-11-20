part of 'create_bootcamp_screen.dart';

const _tracks = [
  'Frontend development',
  'Backend development',
  'Mobile development',
  'UI/UX Design',
  'Cloud & DevOps',
];
const _levels = ['Beginner', 'Intermediate', 'Advanced'];
const _modes = ['Online', 'On-site', 'Hybrid'];
const _instructors = [
  'Omar Khaled · Frontend lead',
  'Tariq Mansour · Flutter lead',
  'Sara Ahmed · UI/UX lead',
];
const _timezones = ['Cairo (GMT+2)', 'Riyadh (GMT+3)', 'UTC'];
const _weekDays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
const _months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

const _stepNames = ['Details', 'Schedule', 'Review'];
const _stepTitles = ['Create bootcamp', 'Schedule & faculty', 'Review & publish'];

const _tint = Color(0xFFE0F0E9);

String _formatDate(DateTime d) => '${_months[d.month - 1]} ${d.day}, ${d.year}';

String? _required(String? v) => v == null || v.trim().isEmpty ? 'This field is required' : null;

String? _validCapacity(String? v) =>
    (int.tryParse(v ?? '') ?? 0) < 1 ? 'Enter a valid capacity' : null;

