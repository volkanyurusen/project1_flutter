part of 'created_activity_bloc.dart';

abstract class CreatedActivityEvent extends Equatable {
  const CreatedActivityEvent();

  @override
  List<Object> get props => [];
}

class AddCreatedActivityEvent extends CreatedActivityEvent {
  final CreatedActivity createdActivity;

  const AddCreatedActivityEvent({
    required this.createdActivity,
  });

  @override
  List<Object> get props => [createdActivity];
}

class UpdateCreatedActivityEvent extends CreatedActivityEvent {
  final CreatedActivity createdActivity;

  const UpdateCreatedActivityEvent({
    required this.createdActivity,
  });

  @override
  List<Object> get props => [createdActivity];
}

class DeleteCreatedActivityEvent extends CreatedActivityEvent {
  final int createdActivityId;

  const DeleteCreatedActivityEvent({
    required this.createdActivityId,
  });

  @override
  List<Object> get props => [createdActivityId];
}
