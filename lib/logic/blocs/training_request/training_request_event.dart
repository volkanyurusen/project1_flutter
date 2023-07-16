part of 'training_request_bloc.dart';

abstract class TrainingRequestEvent extends Equatable {
  const TrainingRequestEvent();

  @override
  List<Object> get props => [];
}

class AddTrainingRequestEvent extends TrainingRequestEvent {
  final TrainingRequest trainingRequest;

  const AddTrainingRequestEvent({
    required this.trainingRequest,
  });

  @override
  List<Object> get props => [trainingRequest];
}

class UpdateTrainingRequestEvent extends TrainingRequestEvent {
  final TrainingRequest trainingRequest;

  const UpdateTrainingRequestEvent({
    required this.trainingRequest,
  });

  @override
  List<Object> get props => [trainingRequest];
}

class DeleteTrainingRequestEvent extends TrainingRequestEvent {
  final int trainingRequestId;

  const DeleteTrainingRequestEvent({
    required this.trainingRequestId,
  });

  @override
  List<Object> get props => [trainingRequestId];
}
