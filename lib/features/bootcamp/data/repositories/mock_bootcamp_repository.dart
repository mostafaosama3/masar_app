import 'package:flutter/foundation.dart';
import 'package:masar_app/features/bootcamp/data/models/bootcamp_draft.dart';
import 'package:masar_app/features/bootcamp/data/repositories/bootcamp_repository.dart';


class MockBootcampRepository implements BootcampRepository {
  @override
  Future<void> createBootcamp(BootcampDraft draft) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    debugPrint('Mock publish: ${draft.toJson()}');
  }
}
