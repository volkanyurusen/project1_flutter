part of 'training_detail_dynamic_by_chosen_attributes_bloc.dart';

abstract class TrainingDetailDynamicByChosenAttributesEvent extends Equatable {
  const TrainingDetailDynamicByChosenAttributesEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingDetailDynamicByChosenAttributesEvent
    extends TrainingDetailDynamicByChosenAttributesEvent {
  final int activityNameId;

  const LoadTrainingDetailDynamicByChosenAttributesEvent({
    required this.activityNameId,
  });

  @override
  List<Object> get props => [
        activityNameId,
      ];
}
