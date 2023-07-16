part of 'activity_type_dynamic_bloc.dart';

abstract class ActivityTypeDynamicEvent extends Equatable {
  const ActivityTypeDynamicEvent();

  @override
  List<Object> get props => [];
}

class LoadActivityTypeDynamicEvent extends ActivityTypeDynamicEvent {}
