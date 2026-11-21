import 'package:masar_app/features/ranking/data/models/ranking_overview.dart';

abstract class RankingRepository {
  Future<RankingOverview> getRanking(RankingScope scope);

  /// Registers the user in a sprint. Throws if it fails.
  Future<void> joinSprint(String sprintId);
}
