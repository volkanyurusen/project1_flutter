part of 'activity_type_dynamic_button_on_find_a_coach_screen_bloc.dart';

abstract class ActivityTypeDynamicButtonOnFindACoachScreenEvent
    extends Equatable {
  const ActivityTypeDynamicButtonOnFindACoachScreenEvent();

  @override
  List<Object?> get props => [];
}

class PressActivityTypeDynamicButtonOnFindACoachScreen
    extends ActivityTypeDynamicButtonOnFindACoachScreenEvent {
  final String activityTypeDynamic;

  const PressActivityTypeDynamicButtonOnFindACoachScreen({
    required this.activityTypeDynamic,
  });

  @override
  List<Object?> get props => [activityTypeDynamic];
}

class CleanActivityTypeDynamicButtonOnFindACoachScreen
    extends ActivityTypeDynamicButtonOnFindACoachScreenEvent {}

// class UnpressActivityTypeDynamicButtonOnFindACoachScreen extends ActivityTypeDynamicButtonOnFindACoachScreenEvent {
//   final String activityTypeDynamic;

//   const UnpressActivityTypeDynamicButtonOnFindACoachScreen({
//     required this.activityTypeDynamic,
//   });

//   @override
//   List<Object?> get props => [activityTypeDynamic];
// }
