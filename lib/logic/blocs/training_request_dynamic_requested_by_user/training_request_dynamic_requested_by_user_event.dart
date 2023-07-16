part of 'training_request_dynamic_requested_by_user_bloc.dart';

abstract class TrainingRequestDynamicRequestedByUserEvent extends Equatable {
  const TrainingRequestDynamicRequestedByUserEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingRequestDynamicRequestedByUserEvent
    extends TrainingRequestDynamicRequestedByUserEvent {
  final int uId;
  final int offset;

  const LoadTrainingRequestDynamicRequestedByUserEvent({
    required this.uId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [uId, offset];
}

class RecallTrainingRequestDynamicRequestedByUserEvent
    extends TrainingRequestDynamicRequestedByUserEvent {}
