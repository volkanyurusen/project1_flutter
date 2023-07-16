part of 'training_request_response_bloc.dart';

abstract class TrainingRequestResponseEvent extends Equatable {
  const TrainingRequestResponseEvent();

  @override
  List<Object> get props => [];
}

class AddTrainingRequestResponseEvent extends TrainingRequestResponseEvent {
  final TrainingRequestResponse trainingRequestResponse;

  const AddTrainingRequestResponseEvent({
    required this.trainingRequestResponse,
  });

  @override
  List<Object> get props => [trainingRequestResponse];
}

class UpdateTrainingRequestResponseEvent extends TrainingRequestResponseEvent {
  final TrainingRequestResponse trainingRequestResponse;

  const UpdateTrainingRequestResponseEvent({
    required this.trainingRequestResponse,
  });

  @override
  List<Object> get props => [trainingRequestResponse];
}

class DeleteTrainingRequestResponseEvent extends TrainingRequestResponseEvent {
  final int trainingRequestResponseId;

  const DeleteTrainingRequestResponseEvent({
    required this.trainingRequestResponseId,
  });

  @override
  List<Object> get props => [trainingRequestResponseId];
}
