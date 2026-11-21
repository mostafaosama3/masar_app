import 'package:flutter/foundation.dart';
import 'package:masar_app/features/bootcamp/data/models/bootcamp_draft.dart';
import 'package:masar_app/features/bootcamp/data/repositories/bootcamp_repository.dart';

/// Pretends to publish. It only prints what WOULD be sent to the server.
class MockBootcampRepository implements BootcampRepository {
  @override
  Future<void> createBootcamp(BootcampDraft draft) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    debugPrint('Mock publish: ${draft.toJson()}');
  }
}
