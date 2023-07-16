part of 'activity_type_dynamic_button_bloc.dart';

abstract class ActivityTypeDynamicButtonEvent extends Equatable {
  const ActivityTypeDynamicButtonEvent();

  @override
  List<Object?> get props => [];
}

class PressActivityTypeDynamicButton extends ActivityTypeDynamicButtonEvent {
  final String activityTypeDynamic;

  const PressActivityTypeDynamicButton({
    required this.activityTypeDynamic,
  });

  @override
  List<Object?> get props => [activityTypeDynamic];
}

class CleanActivityTypeDynamicButton extends ActivityTypeDynamicButtonEvent {}

// class UnpressActivityTypeDynamicButton extends ActivityTypeDynamicButtonEvent {
//   final String activityTypeDynamic;

//   const UnpressActivityTypeDynamicButton({
//     required this.activityTypeDynamic,
//   });

//   @override
//   List<Object?> get props => [activityTypeDynamic];
// }
