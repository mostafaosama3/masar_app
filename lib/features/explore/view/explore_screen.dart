import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/styles/app_colors.dart';
import 'package:masar_app/core/widgets/custom_textfield.dart';
import 'package:masar_app/features/explore/view/details_screen.dart';
import 'package:masar_app/features/explore/widgets/explore_widgets/filterPill.dart';

import '../../../core/styles/text_styles.dart';
import '../../bootcampsDetailes/views/details_screen.dart';
import '../data/dummy_data.dart';
import '../widgets/explore_widgets/academyTile.dart';
import '../widgets/explore_widgets/explore_cards.dart';
import '../widgets/explore_widgets/skillGapCard.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController searchController = TextEditingController();
  String selectedTrack = 'All Tracks';
  bool remoteFilter = true;
  bool sponsoredFilter = true;
  String sortBy = 'Deadline: Soonest';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final query = searchController.text.trim().toLowerCase();
    final filteredBootcamps = featuredBootcampsList.where((b) {
      return query.isEmpty ||
          b.title.toLowerCase().contains(query) ||
          b.academy.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F9F7),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 1. Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MASAR EXECUTIVE',
                      style: TextStyles.caption2.copyWith(
                        fontWeight: FontWeight.w600,
                        color: LightPalette.primaryColor,
                      ),
                    ),
                    Text(
                      'Explore',
                      style: TextStyles.headline2.copyWith(color: LightPalette.primaryColor),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () => showSnack('Notifications'),
                        icon: const Icon(Icons.notifications_none, color: Color(0xFF102A21)),
                      ),
                    ),
                    const Positioned(
                      top: 8,
                      right: 10,
                      child: CircleAvatar(radius: 4, backgroundColor: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
            Gap(14),

            // 2. Search + Filter button
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: searchController,
                    onChanged: (_) => setState(() {}),
                    postfixIcon: const Icon(Icons.mic),
                    hintText: 'Search bootcamps, compani...',
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                Gap(10),
                InkWell(
                  onTap: () => showSnack('Filters'),
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: LightPalette.primaryColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.tune, color: Colors.white),
                  ),
                ),
              ],
            ),
            Gap(10),

            // Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  if (remoteFilter) ...[
                    FilterPill(
                      label: 'Remote',
                      icon: Icons.laptop_mac,
                      isSelected: true,
                      onTap: () => setState(() => remoteFilter = false),
                    ),
                    const SizedBox(width: 8),
                  ],
                  if (sponsoredFilter) ...[
                    FilterPill(
                      label: 'Free / Sponsored',
                      icon: Icons.verified_outlined,
                      isSelected: true,
                      onTap: () => setState(() => sponsoredFilter = false),
                    ),
                    Gap(8),
                  ],
                  FilterPill(
                    label: 'Duration: 8 - 12 wks',
                    icon: Icons.schedule,
                    isSelected: false,
                    onTap: () => showSnack('Duration filter'),
                  ),
                ],
              ),
            ),
            Gap(16),

            // 3. Curated Tracks
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Curated Tracks',
                  style: TextStyles.title2.copyWith(color: LightPalette.primaryColor),
                ),
                Text(
                  'SWIPE TRACKS',
                  style: TextStyles.caption1.copyWith(color: LightPalette.secondaryColor),
                ),
              ],
            ),
            Gap(10),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: tracksList.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final track = tracksList[index];
                  final active = track == selectedTrack;

                  return InkWell(
                    onTap: () => setState(() => selectedTrack = track),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: active ? LightPalette.primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: active ? LightPalette.primaryColor : const Color(0xFFDCE5E0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            index == 0 ? Icons.track_changes : Icons.code_rounded,
                            size: 15,
                            color: active ? Colors.white : LightPalette.primaryColor,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            track,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: active ? Colors.white : LightPalette.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Gap(18),

            // 4. Featured Bootcamps
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '• Featured Bootcamps',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF102A21),
                  ),
                ),
                TextButton(
                  onPressed: () => showSnack('See 14 open'),
                  child: Text(
                    'See 14 open >',
                    style: TextStyles.caption1.copyWith(
                      color: LightPalette.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: filteredBootcamps.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final item = filteredBootcamps[index];
                  return FeaturedBootcampTile(
                    item: item,
                    onDetailsTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BootcampDetailsScreenn.fromBootcamp(item),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Gap(20),

            // 5. Top Vetted Academies
            const Text(
              'Top Vetted Academies',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF102A21)),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: AcademyTile(
                    item: academiesList[0],
                    onFollowTap: () => setState(() {
                      academiesList[0].isFollowing = !academiesList[0].isFollowing;
                    }),
                  ),
                ),
                Gap(10),
                Expanded(
                  child: AcademyTile(
                    item: academiesList[1],
                    onFollowTap: () => setState(() {
                      academiesList[1].isFollowing = !academiesList[1].isFollowing;
                    }),
                  ),
                ),
              ],
            ),
            Gap(18),

            // 6. Skill Gap Banner
            SkillGapCard(onTap: () => showSnack('Skill Gap Evaluator')),
            Gap(5),

            // 7. Available Programs
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Available Programs',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF102A21),
                        ),
                      ),
                      const Gap(2),
                      Text(
                        'Showing ${programsList.length} verified application rounds',
                        style: TextStyles.caption1.copyWith(color: LightPalette.secondaryColor),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: LightPalette.borderColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFDCE5E0)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.swap_vert, size: 16, color: Color(0xFF102A21)),
                        const Gap(6),
                        Text(
                          sortBy.replaceFirst(': ', ':\n'),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF102A21),
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Gap(10),
            ...programsList.map(
              (program) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ProgramTilee(
                  item: program,
                  onSaveTap: () => setState(() => program.isSaved = !program.isSaved),
                  onApplyTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BootcampDetailsScreenn.fromProgram(program),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
