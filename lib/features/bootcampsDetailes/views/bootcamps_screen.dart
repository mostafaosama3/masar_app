// lib/features/bootcamps/views/bootcamps_screen.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:masar_app/core/constants/app_images.dart';
import 'package:masar_app/core/routes/navigation.dart';
import 'package:masar_app/core/routes/routes_name.dart';
import 'package:masar_app/core/styles/themed_background.dart';

import '../../../core/widgets/custom_textfield.dart';
import '../../bootcamp/create_bootcamp_screen.dart';
import '../data/dummy_data.dart';
import '../model/bootcamp_model.dart';
import '../widgets/bootcamps/bootcamp_card.dart';
import '../widgets/bootcamps/bootcamp_header.dart';
import '../widgets/bootcamps/create_banner.dart';
import '../widgets/bootcamps/fiter_bar.dart';

class BootcampsScreen extends StatefulWidget {
  const BootcampsScreen({super.key});

  @override
  State<BootcampsScreen> createState() => _BootcampsScreenState();
}

class _BootcampsScreenState extends State<BootcampsScreen> {
  final TextEditingController _searchController = TextEditingController();
  BootcampStatus _selectedStatus = BootcampStatus.active;
  String _searchQuery = '';
  int _navIndex = 1; // Bootcamps tab

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<BootcampModel> get _filteredBootcamps {
    return dummyBootcamps.where((item) {
      final matchesStatus = item.status == _selectedStatus;
      final query = _searchQuery.trim().toLowerCase();
      final matchesSearch =
          query.isEmpty ||
          item.title.toLowerCase().contains(query) ||
          item.track.toLowerCase().contains(query);
      return matchesStatus && matchesSearch;
    }).toList();
  }

  Map<BootcampStatus, int> get _statusCounts {
    return {
      for (final status in BootcampStatus.values)
        status: dummyBootcamps.where((b) => b.status == status).length,
    };
  }

  @override
  Widget build(BuildContext context) {
    final items = _filteredBootcamps;

    return ThemedScreenBackground(
      lightAsset: AppImages.lightBackground,
      darkAsset: AppImages.darkBackGround,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BootcampHeader(
                      liveCount: _statusCounts[BootcampStatus.active] ?? 0,
                      onAddTap: () => pushTo(context, RouteNames.createBootcamp),
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: _searchController,
                            hintText: 'Search bootcamps, tracks, or titles...',
                            prefixIcon: const Icon(Icons.search),
                          ),
                        ),
                        const Gap(10),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
                        ),
                      ],
                    ),
                    const Gap(14),
                    BootcampFilterBar(
                      selectedStatus: _selectedStatus,
                      counts: _statusCounts,
                      onSelect: (status) => setState(() => _selectedStatus = status),
                    ),
                  ],
                ),
              ),

              // 2. الجزء اللي بيسكرول بس: الكروت
              Expanded(
                child: items.isEmpty
                    ? const Center(child: Text('No bootcamps match your filter.'))
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
                        itemCount: items.length,
                        separatorBuilder: (_, __) => const Gap(14),
                        itemBuilder: (context, index) {
                          final bootcamp = items[index];
                          return BootcampCard(
                            bootcamp: bootcamp,
                            onManageTap: () {},
                            onDetailsTap: () =>
                                pushTo(context, RouteNames.bootcampDetails, extra: bootcamp),
                          );
                        },
                      ),
              ),

              // 3. الجزء الثابت السفلي: البانر
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
                child: CreateBootcampBanner(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CreateBootcampScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _navIndex,
          onTap: (index) => setState(() => _navIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined), label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.school_outlined), label: 'Bootcamps'),
            BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: 'People'),
            BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: 'Analytics'),
            BottomNavigationBarItem(icon: Icon(Icons.apartment_outlined), label: 'Company'),
          ],
        ),
      ),
    );
  }
}
