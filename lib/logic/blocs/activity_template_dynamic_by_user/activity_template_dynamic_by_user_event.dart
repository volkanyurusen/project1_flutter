part of 'activity_template_dynamic_by_user_bloc.dart';

abstract class ActivityTemplateDynamicByUserEvent extends Equatable {
  const ActivityTemplateDynamicByUserEvent();

  @override
  List<Object> get props => [];
}

class LoadActivityTemplateDynamicByUserEvent
    extends ActivityTemplateDynamicByUserEvent {
  final int uId;
  final int offset;

  const LoadActivityTemplateDynamicByUserEvent({
    required this.uId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [uId, offset];
}

class RecallActivityTemplateDynamicByUserEvent
    extends ActivityTemplateDynamicByUserEvent {}
