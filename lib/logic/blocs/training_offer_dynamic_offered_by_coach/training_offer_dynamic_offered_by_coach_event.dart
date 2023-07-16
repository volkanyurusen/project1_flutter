part of 'training_offer_dynamic_offered_by_coach_bloc.dart';

abstract class TrainingOfferDynamicOfferedByCoachEvent extends Equatable {
  const TrainingOfferDynamicOfferedByCoachEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainingOfferDynamicOfferedByCoachEvent
    extends TrainingOfferDynamicOfferedByCoachEvent {
  final int coachId;
  final int offset;

  const LoadTrainingOfferDynamicOfferedByCoachEvent({
    required this.coachId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [coachId, offset];
}

class RecallTrainingOfferDynamicOfferedByCoachEvent
    extends TrainingOfferDynamicOfferedByCoachEvent {}
