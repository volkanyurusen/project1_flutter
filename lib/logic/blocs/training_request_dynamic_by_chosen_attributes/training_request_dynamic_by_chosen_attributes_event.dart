part of 'training_request_dynamic_by_chosen_attributes_bloc.dart';

abstract class TrainingRequestDynamicByChosenAttributesEvent extends Equatable {
  const TrainingRequestDynamicByChosenAttributesEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingRequestDynamicByChosenAttributesEvent
    extends TrainingRequestDynamicByChosenAttributesEvent {
  final int trainingRequesterId;
  final int trainingDetailId;
  final int locationDetailId;

  const LoadTrainingRequestDynamicByChosenAttributesEvent({
    required this.trainingRequesterId,
    required this.trainingDetailId,
    required this.locationDetailId,
  });

  @override
  List<Object> get props =>
      [trainingRequesterId, trainingDetailId, locationDetailId];
}
