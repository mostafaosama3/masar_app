import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar_app/features/ranking/data/models/ranking_overview.dart';
import 'package:masar_app/features/ranking/data/repositories/ranking_repository.dart';

part 'ranking_state.dart';

class RankingCubit extends Cubit<RankingState> {
  RankingCubit(this._repository) : super(const RankingState());

  final RankingRepository _repository;

  /// Loads the board for [scope] (defaults to the selected tab).
  /// [refresh] = true (pull-to-refresh) keeps the current content on screen.
  Future<void> load({RankingScope? scope, bool refresh = false}) async {
    final target = scope ?? state.scope;

    emit(
      refresh && state.overview != null
          ? state.copyWith(scope: target)
          : RankingState(scope: target, status: RankingStatus.loading),
    );

    try {
      final overview = await _repository.getRanking(target);

      // The user switched tabs while this was loading: drop the stale answer.
      if (state.scope != target) return;

      emit(state.copyWith(status: RankingStatus.loaded, overview: overview));
    } catch (_) {
      if (state.scope != target) return;

      // A failed refresh keeps the old data on screen.
      if (refresh && state.overview != null) return;

      emit(RankingState(scope: target, status: RankingStatus.failure));
    }
  }

  void selectScope(RankingScope scope) {
    if (scope == state.scope && state.status != RankingStatus.failure) return;
    load(scope: scope);
  }

  Future<void> joinSprint() async {
    final sprint = state.overview?.sprint;
    if (sprint == null || sprint.joined || state.isJoining) return;

    emit(state.copyWith(isJoining: true));

    try {
      await _repository.joinSprint(sprint.id);

      final overview = state.overview;
      emit(
        state.copyWith(
          isJoining: false,
          overview: overview?.copyWith(sprint: sprint.copyWith(joined: true)),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isJoining: false,
          joinError: 'Could not join the sprint. Please try again.',
        ),
      );
    }
  }
}
