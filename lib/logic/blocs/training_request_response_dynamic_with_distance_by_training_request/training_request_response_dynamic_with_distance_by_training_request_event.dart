part of 'training_request_response_dynamic_with_distance_by_training_request_bloc.dart';

abstract class TrainingRequestResponseDynamicWithDistanceByTrainingRequestEvent
    extends Equatable {
  const TrainingRequestResponseDynamicWithDistanceByTrainingRequestEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingRequestResponseDynamicWithDistanceByTrainingRequestEvent
    extends TrainingRequestResponseDynamicWithDistanceByTrainingRequestEvent {
  final int trainingRequestId;
  final int offset;

  const LoadTrainingRequestResponseDynamicWithDistanceByTrainingRequestEvent({
    required this.trainingRequestId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [trainingRequestId, offset];
}

class CleanTrainingRequestResponseDynamicWithDistanceByTrainingRequest
    extends TrainingRequestResponseDynamicWithDistanceByTrainingRequestEvent {}
