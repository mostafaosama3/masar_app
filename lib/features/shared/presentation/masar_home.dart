import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar_app/core/functions/extensions.dart';

import 'package:masar_app/features/bootcamp/cubit/create_bootcamp_cubit.dart';
import 'package:masar_app/features/bootcamp/data/repositories/mock_bootcamp_repository.dart';
import 'package:masar_app/features/bootcamp/create_bootcamp_screen.dart';

import 'package:masar_app/features/my_learning/data/repositories/mock_my_learning_repository.dart';
import 'package:masar_app/features/my_learning/presentation/cubit/my_learning_cubit.dart';
import 'package:masar_app/features/my_learning/presentation/my_learning_screen.dart';

import 'package:masar_app/features/ranking/data/repositories/mock_ranking_repository.dart';
import 'package:masar_app/features/ranking/presentation/cubit/ranking_cubit.dart';
import 'package:masar_app/features/ranking/presentation/ranking_screen.dart';

import 'package:masar_app/features/profile/profile_screen.dart';

import 'package:masar_app/features/shared/presentation/masar_bottom_nav.dart';

import '../../explore/view/explore_screen.dart';

/// App shell: the five tabs + the bottom navigation bar.
class MasarHome extends StatefulWidget {
  const MasarHome({super.key});

  @override
  State<MasarHome> createState() => _MasarHomeState();
}

class _MasarHomeState extends State<MasarHome> {
  int _selectedIndex = 2;

  void _openBootcamp() => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) => CreateBootcampCubit(MockBootcampRepository()),
        child: const CreateBootcampScreen(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            const _PlaceholderPage(title: 'Home', icon: Icons.home_outlined),

            ExploreScreen(),

            BlocProvider(
              create: (_) => MyLearningCubit(MockMyLearningRepository())..load(),
              child: MyLearningScreen(onCreateBootcamp: _openBootcamp),
            ),

            BlocProvider(
              create: (_) => RankingCubit(MockRankingRepository())..load(),
              child: const RankingScreen(),
            ),

            const ProfileScreen(),
          ],
        ),
      ),

      bottomNavigationBar: MasarBottomNav(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 42, color: context.colorScheme.primary),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
