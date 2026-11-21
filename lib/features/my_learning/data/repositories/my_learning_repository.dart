import 'package:masar_app/features/my_learning/data/models/learning_overview.dart';
abstract class MyLearningRepository {
  Future<LearningOverview> getOverview();
}
