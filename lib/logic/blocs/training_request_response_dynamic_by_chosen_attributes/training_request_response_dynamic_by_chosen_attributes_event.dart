part of 'training_request_response_dynamic_by_chosen_attributes_bloc.dart';

abstract class TrainingRequestResponseDynamicByChosenAttributesEvent
    extends Equatable {
  const TrainingRequestResponseDynamicByChosenAttributesEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingRequestResponseDynamicByChosenAttributesEvent
    extends TrainingRequestResponseDynamicByChosenAttributesEvent {
  final int trainingRequestId;
  final int coachId;

  const LoadTrainingRequestResponseDynamicByChosenAttributesEvent({
    required this.trainingRequestId,
    required this.coachId,
  });

  @override
  List<Object> get props => [trainingRequestId, coachId];
}
