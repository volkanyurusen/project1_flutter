part of 'activity_type_dynamic_button_on_create_activity_screen_bloc.dart';

abstract class ActivityTypeDynamicButtonOnCreateActivityScreenEvent
    extends Equatable {
  const ActivityTypeDynamicButtonOnCreateActivityScreenEvent();

  @override
  List<Object?> get props => [];
}

class PressActivityTypeDynamicButtonOnCreateActivityScreen
    extends ActivityTypeDynamicButtonOnCreateActivityScreenEvent {
  final String activityTypeDynamic;

  const PressActivityTypeDynamicButtonOnCreateActivityScreen({
    required this.activityTypeDynamic,
  });

  @override
  List<Object?> get props => [activityTypeDynamic];
}

class CleanActivityTypeDynamicButtonOnCreateActivityScreen
    extends ActivityTypeDynamicButtonOnCreateActivityScreenEvent {}

// class UnpressActivityTypeDynamicButtonOnCreateActivityScreen extends ActivityTypeDynamicButtonOnCreateActivityScreenEvent {
//   final String activityTypeDynamic;

//   const UnpressActivityTypeDynamicButtonOnCreateActivityScreen({
//     required this.activityTypeDynamic,
//   });

//   @override
//   List<Object?> get props => [activityTypeDynamic];
// }
