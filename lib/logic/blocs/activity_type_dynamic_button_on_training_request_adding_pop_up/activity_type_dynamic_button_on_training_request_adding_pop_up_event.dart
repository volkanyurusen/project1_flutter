part of 'activity_type_dynamic_button_on_training_request_adding_pop_up_bloc.dart';

abstract class ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpEvent extends Equatable {
  const ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpEvent();

  @override
  List<Object?> get props => [];
}

class PressActivityTypeDynamicButtonOnTrainingRequestAddingPopUp
    extends ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpEvent {
  final String activityTypeDynamic;

  const PressActivityTypeDynamicButtonOnTrainingRequestAddingPopUp({
    required this.activityTypeDynamic,
  });

  @override
  List<Object?> get props => [activityTypeDynamic];
}

class CleanActivityTypeDynamicButtonOnTrainingRequestAddingPopUp
    extends ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpEvent {}

// class UnpressActivityTypeDynamicButtonOnTrainingRequestAddingPopUp extends ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpEvent {
//   final String activityTypeDynamic;

//   const UnpressActivityTypeDynamicButtonOnTrainingRequestAddingPopUp({
//     required this.activityTypeDynamic,
//   });

//   @override
//   List<Object?> get props => [activityTypeDynamic];
// }
