import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar_app/features/my_learning/data/models/learning_overview.dart';
import 'package:masar_app/features/my_learning/data/repositories/my_learning_repository.dart';

part 'my_learning_state.dart';

class MyLearningCubit extends Cubit<MyLearningState> {
  MyLearningCubit(this._repository) : super(const MyLearningInitial());

  final MyLearningRepository _repository;

  /// [refresh] = true is used by pull-to-refresh: the current content stays
  /// on screen instead of flashing a loading spinner.
  Future<void> load({bool refresh = false}) async {
    if (!refresh) emit(const MyLearningLoading());

    try {
      final overview = await _repository.getOverview();
      emit(MyLearningLoaded(overview));
    } catch (_) {
      // On a failed refresh keep showing the old data.
      if (refresh && state is MyLearningLoaded) return;
      emit(const MyLearningFailure('Could not load your learning data.'));
    }
  }
}
