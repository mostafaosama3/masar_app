import 'package:masar_app/features/bootcamp/data/models/bootcamp_draft.dart';

abstract class BootcampRepository {
  /// Publishes a new bootcamp. Throws if it fails.
  Future<void> createBootcamp(BootcampDraft draft);
}
