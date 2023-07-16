part of 'activity_type_dynamic_button_on_training_request_updating_pop_up_bloc.dart';

abstract class ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpEvent
    extends Equatable {
  const ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpEvent();

  @override
  List<Object?> get props => [];
}

class PressActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUp
    extends ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpEvent {
  final String activityTypeDynamic;

  const PressActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUp({
    required this.activityTypeDynamic,
  });

  @override
  List<Object?> get props => [activityTypeDynamic];
}

class CleanActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUp
    extends ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpEvent {}

// class UnpressActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUp extends ActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUpEvent {
//   final String activityTypeDynamic;

//   const UnpressActivityTypeDynamicButtonOnTrainingRequestUpdatingPopUp({
//     required this.activityTypeDynamic,
//   });

//   @override
//   List<Object?> get props => [activityTypeDynamic];
// }
