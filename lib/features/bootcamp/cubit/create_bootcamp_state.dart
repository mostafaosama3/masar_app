part of 'create_bootcamp_cubit.dart';

sealed class CreateBootcampState {
  const CreateBootcampState();
}

class CreateBootcampInitial extends CreateBootcampState {
  const CreateBootcampInitial();
}

class CreateBootcampSubmitting extends CreateBootcampState {
  const CreateBootcampSubmitting();
}

class CreateBootcampSuccess extends CreateBootcampState {
  const CreateBootcampSuccess();
}

class CreateBootcampFailure extends CreateBootcampState {
  const CreateBootcampFailure(this.message);

  final String message;
}
