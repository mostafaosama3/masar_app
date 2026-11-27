class HomeData {
  const HomeData({
    required this.userName,
    required this.programTitle,
    required this.trackName,
    required this.moduleNumber,
    required this.moduleTitle,
    required this.progress,
    required this.duration,
    required this.deadline,
    required this.score,
    required this.nextLessonTitle,
  });

  final String userName;
  final String programTitle;
  final String trackName;
  final int moduleNumber;
  final String moduleTitle;
  final double progress; // من 0 إلى 1
  final String duration;
  final String deadline;
  final String score;
  final String nextLessonTitle;
}