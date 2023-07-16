part of 'consisted_activity_bloc.dart';

abstract class ConsistedActivityEvent extends Equatable {
  const ConsistedActivityEvent();

  @override
  List<Object> get props => [];
}

class AddConsistedActivityEvent extends ConsistedActivityEvent {
  final ConsistedActivity consistedActivity;

  const AddConsistedActivityEvent({
    required this.consistedActivity,
  });

  @override
  List<Object> get props => [consistedActivity];
}

class UpdateConsistedActivityEvent extends ConsistedActivityEvent {
  final ConsistedActivity consistedActivity;

  const UpdateConsistedActivityEvent({
    required this.consistedActivity,
  });

  @override
  List<Object> get props => [consistedActivity];
}

class DeleteConsistedActivityEvent extends ConsistedActivityEvent {
  final int consistedActivityId;

  const DeleteConsistedActivityEvent({
    required this.consistedActivityId,
  });

  @override
  List<Object> get props => [consistedActivityId];
}
