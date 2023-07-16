part of 'location_template_dynamic_by_user_bloc.dart';

abstract class LocationTemplateDynamicByUserEvent extends Equatable {
  const LocationTemplateDynamicByUserEvent();

  @override
  List<Object> get props => [];
}

class LoadLocationTemplateDynamicByUserEvent
    extends LocationTemplateDynamicByUserEvent {
  final int uId;
  final int offset;

  const LoadLocationTemplateDynamicByUserEvent({
    required this.uId,
    this.offset = 0,
  });

  @override
  List<Object> get props => [uId, offset];
}

class RecallLocationTemplateDynamicByUserEvent
    extends LocationTemplateDynamicByUserEvent {}
