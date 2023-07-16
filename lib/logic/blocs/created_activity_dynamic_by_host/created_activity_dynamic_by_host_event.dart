part of 'created_activity_dynamic_by_host_bloc.dart';

abstract class CreatedActivityDynamicByHostEvent extends Equatable {
  const CreatedActivityDynamicByHostEvent();

  @override
  List<Object> get props => [];
}

class LoadCreatedActivityDynamicByHostEvent
    extends CreatedActivityDynamicByHostEvent {
  final int hostId;
  final int offset;

  const LoadCreatedActivityDynamicByHostEvent({
    required this.hostId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [hostId, offset];
}

class RecallCreatedActivityDynamicByHostEvent
    extends CreatedActivityDynamicByHostEvent {}
