part of 'activity_type_dynamic_button_on_training_offer_adding_pop_up_bloc.dart';

abstract class ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpEvent
    extends Equatable {
  const ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpEvent();

  @override
  List<Object?> get props => [];
}

class PressActivityTypeDynamicButtonOnTrainingOfferAddingPopUp
    extends ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpEvent {
  final String activityTypeDynamic;

  const PressActivityTypeDynamicButtonOnTrainingOfferAddingPopUp({
    required this.activityTypeDynamic,
  });

  @override
  List<Object?> get props => [activityTypeDynamic];
}

class CleanActivityTypeDynamicButtonOnTrainingOfferAddingPopUp
    extends ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpEvent {}

// class UnpressActivityTypeDynamicButtonOnTrainingOfferAddingPopUp extends ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpEvent {
//   final String activityTypeDynamic;

//   const UnpressActivityTypeDynamicButtonOnTrainingOfferAddingPopUp({
//     required this.activityTypeDynamic,
//   });

//   @override
//   List<Object?> get props => [activityTypeDynamic];
// }
