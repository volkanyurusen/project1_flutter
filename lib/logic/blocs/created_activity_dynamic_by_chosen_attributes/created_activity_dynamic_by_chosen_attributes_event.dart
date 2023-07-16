part of 'created_activity_dynamic_by_chosen_attributes_bloc.dart';

abstract class CreatedActivityDynamicByChosenAttributesEvent extends Equatable {
  const CreatedActivityDynamicByChosenAttributesEvent();

  @override
  List<Object> get props => [];
}

class LoadCreatedActivityDynamicByChosenAttributesEvent
    extends CreatedActivityDynamicByChosenAttributesEvent {
  final int activityNameId;
  final int hostId;

  const LoadCreatedActivityDynamicByChosenAttributesEvent({
    required this.activityNameId,
    required this.hostId,
  });

  @override
  List<Object> get props => [activityNameId, hostId];
}
