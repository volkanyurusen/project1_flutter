part of 'activity_name_dynamic_by_chosen_attributes_bloc.dart';

abstract class ActivityNameDynamicByChosenAttributesEvent extends Equatable {
  const ActivityNameDynamicByChosenAttributesEvent();

  @override
  List<Object> get props => [];
}

class LoadActivityNameDynamicByChosenAttributesEvent
    extends ActivityNameDynamicByChosenAttributesEvent {
  final int? activityNameId;

  const LoadActivityNameDynamicByChosenAttributesEvent({
    this.activityNameId,
  });

  @override
  List<Object> get props => [activityNameId!];
}
