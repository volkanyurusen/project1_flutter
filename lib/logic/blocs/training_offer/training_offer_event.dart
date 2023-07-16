part of 'training_offer_bloc.dart';

abstract class TrainingOfferEvent extends Equatable {
  const TrainingOfferEvent();

  @override
  List<Object> get props => [];
}

class AddTrainingOfferEvent extends TrainingOfferEvent {
  final TrainingOffer trainingOffer;

  const AddTrainingOfferEvent({
    required this.trainingOffer,
  });

  @override
  List<Object> get props => [trainingOffer];
}

class UpdateTrainingOfferEvent extends TrainingOfferEvent {
  final TrainingOffer trainingOffer;

  const UpdateTrainingOfferEvent({
    required this.trainingOffer,
  });

  @override
  List<Object> get props => [trainingOffer];
}

class DeleteTrainingOfferEvent extends TrainingOfferEvent {
  final int trainingOfferId;

  const DeleteTrainingOfferEvent({
    required this.trainingOfferId,
  });

  @override
  List<Object> get props => [trainingOfferId];
}
