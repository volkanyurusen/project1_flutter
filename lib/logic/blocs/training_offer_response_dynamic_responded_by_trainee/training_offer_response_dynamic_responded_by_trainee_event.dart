part of 'training_offer_response_dynamic_responded_by_trainee_bloc.dart';

abstract class TrainingOfferResponseDynamicRespondedByTraineeEvent
    extends Equatable {
  const TrainingOfferResponseDynamicRespondedByTraineeEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingOfferResponseDynamicRespondedByTraineeEvent
    extends TrainingOfferResponseDynamicRespondedByTraineeEvent {
  final int traineeId;
  final int offset;

  const LoadTrainingOfferResponseDynamicRespondedByTraineeEvent({
    required this.traineeId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [traineeId, offset];
}

class RecallTrainingOfferResponseDynamicRespondedByTraineeEvent
    extends TrainingOfferResponseDynamicRespondedByTraineeEvent {}
