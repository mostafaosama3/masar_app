part of 'my_learning_cubit.dart';

sealed class MyLearningState {
  const MyLearningState();
}

class MyLearningInitial extends MyLearningState {
  const MyLearningInitial();
}

class MyLearningLoading extends MyLearningState {
  const MyLearningLoading();
}

class MyLearningLoaded extends MyLearningState {
  const MyLearningLoaded(this.overview);

  final LearningOverview overview;
}

class MyLearningFailure extends MyLearningState {
  const MyLearningFailure(this.message);

  final String message;
}
