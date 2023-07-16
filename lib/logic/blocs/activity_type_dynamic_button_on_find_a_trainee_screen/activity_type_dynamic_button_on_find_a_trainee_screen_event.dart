part of 'activity_type_dynamic_button_on_find_a_trainee_screen_bloc.dart';

abstract class ActivityTypeDynamicButtonOnFindATraineeScreenEvent
    extends Equatable {
  const ActivityTypeDynamicButtonOnFindATraineeScreenEvent();

  @override
  List<Object?> get props => [];
}

class PressActivityTypeDynamicButtonOnFindATraineeScreen
    extends ActivityTypeDynamicButtonOnFindATraineeScreenEvent {
  final String activityTypeDynamic;

  const PressActivityTypeDynamicButtonOnFindATraineeScreen({
    required this.activityTypeDynamic,
  });

  @override
  List<Object?> get props => [activityTypeDynamic];
}

class CleanActivityTypeDynamicButtonOnFindATraineeScreen
    extends ActivityTypeDynamicButtonOnFindATraineeScreenEvent {}

// class UnpressActivityTypeDynamicButtonOnFindATraineeScreen extends ActivityTypeDynamicButtonOnFindATraineeScreenEvent {
//   final String activityTypeDynamic;

//   const UnpressActivityTypeDynamicButtonOnFindATraineeScreen({
//     required this.activityTypeDynamic,
//   });

//   @override
//   List<Object?> get props => [activityTypeDynamic];
// }
