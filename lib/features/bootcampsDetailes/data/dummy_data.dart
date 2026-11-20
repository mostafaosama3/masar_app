// lib/features/bootcamps/data/dummy_bootcamps.dart
import 'package:masar_app/core/constants/app_images.dart';

import '../model/bootcamp_model.dart';

final List<BootcampModel> dummyBootcamps = [
  BootcampModel(
    id: '1',
    title: 'Flutter Enterprise Architecture & Clean Code',
    track: 'Flutter',
    mode: 'Online',
    dateRange: 'Mar 1 - Apr 30, 2026',
    duration: '2 Months',
    enrolledCount: 124,
    seatsLeft: 24,
    progress: 0.84,
    status: BootcampStatus.active,
    imageAsset: AppImages.Flutterlogo,
  ),
  BootcampModel(
    id: '2',
    title: 'Go & Microservices Architecture',
    track: 'Go',
    mode: 'In-Person',
    dateRange: 'Feb 15 - Apr 15, 2026',
    duration: '2 Months',
    enrolledCount: 98,
    seatsLeft: 78,
    progress: 0.62,
    status: BootcampStatus.active,
    imageAsset: AppImages.Laptopcourse,
  ),
  BootcampModel(
    id: '3',
    title: 'Advanced React & Next.js Development',
    track: 'Frontend',
    mode: 'Online',
    dateRange: 'Apr 20 - Jun 20, 2026',
    duration: '2 Months',
    enrolledCount: 0,
    seatsLeft: 50,
    progress: 0.0,
    status: BootcampStatus.upcoming,
    imageAsset: AppImages.Reactlogotile,
  ),
];
