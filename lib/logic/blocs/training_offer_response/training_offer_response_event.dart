part of 'training_offer_response_bloc.dart';

abstract class TrainingOfferResponseEvent extends Equatable {
  const TrainingOfferResponseEvent();

  @override
  List<Object> get props => [];
}

class AddTrainingOfferResponseEvent extends TrainingOfferResponseEvent {
  final TrainingOfferResponse trainingOfferResponse;

  const AddTrainingOfferResponseEvent({
    required this.trainingOfferResponse,
  });

  @override
  List<Object> get props => [trainingOfferResponse];
}

class UpdateTrainingOfferResponseEvent extends TrainingOfferResponseEvent {
  final TrainingOfferResponse trainingOfferResponse;

  const UpdateTrainingOfferResponseEvent({
    required this.trainingOfferResponse,
  });

  @override
  List<Object> get props => [trainingOfferResponse];
}

class DeleteTrainingOfferResponseEvent extends TrainingOfferResponseEvent {
  final int trainingOfferResponseId;

  const DeleteTrainingOfferResponseEvent({
    required this.trainingOfferResponseId,
  });

  @override
  List<Object> get props => [trainingOfferResponseId];
}
