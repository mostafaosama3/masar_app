import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:masar_app/features/bootcamp/cubit/create_bootcamp_cubit.dart';
import 'package:masar_app/features/bootcamp/data/repositories/mock_bootcamp_repository.dart';
import 'package:masar_app/features/bootcamp/create_bootcamp_screen.dart';

import 'package:masar_app/features/home/home_screen.dart';

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
  int _selectedIndex = 0;

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
            const HomeScreen(),

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