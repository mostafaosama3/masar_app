import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar_app/features/bootcamp/data/models/bootcamp_draft.dart';
import 'package:masar_app/features/bootcamp/data/repositories/bootcamp_repository.dart';

part 'create_bootcamp_state.dart';

class CreateBootcampCubit extends Cubit<CreateBootcampState> {
  CreateBootcampCubit(this._repository) : super(const CreateBootcampInitial());

  final BootcampRepository _repository;

  Future<void> submit(BootcampDraft draft) async {
    // Ignore double taps while a request is already running.
    if (state is CreateBootcampSubmitting) return;

    emit(const CreateBootcampSubmitting());

    try {
      await _repository.createBootcamp(draft);
      emit(const CreateBootcampSuccess());
    } catch (_) {
      emit(const CreateBootcampFailure(
        'Could not publish the bootcamp. Please try again.',
      ));
    }
  }
}
