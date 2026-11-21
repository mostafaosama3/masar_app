import 'package:masar_app/features/my_learning/data/models/learning_overview.dart';

/// The contract the Cubit depends on. Today it is implemented by a mock;
/// later by a class that calls the real backend. The UI never changes.
abstract class MyLearningRepository {
  Future<LearningOverview> getOverview();
}
