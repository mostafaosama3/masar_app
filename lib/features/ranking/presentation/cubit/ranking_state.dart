part of 'ranking_cubit.dart';

enum RankingStatus { loading, loaded, failure }

class RankingState {
  const RankingState({
    this.status = RankingStatus.loading,
    this.scope = RankingScope.cohort,
    this.overview,
    this.isJoining = false,
    this.joinError,
  });

  final RankingStatus status;

  /// The tab the user selected (can be ahead of [overview] while loading).
  final RankingScope scope;
  final RankingOverview? overview;
  final bool isJoining;

  /// One-shot message for a failed "Join" (shown as a snackbar).
  final String? joinError;

  RankingState copyWith({
    RankingStatus? status,
    RankingScope? scope,
    RankingOverview? overview,
    bool? isJoining,
    String? joinError,
  }) =>
      RankingState(
        status: status ?? this.status,
        scope: scope ?? this.scope,
        overview: overview ?? this.overview,
        isJoining: isJoining ?? this.isJoining,
        // Not carried over: the error is cleared on every new state.
        joinError: joinError,
      );
}
