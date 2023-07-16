part of 'activity_template_bloc.dart';

abstract class ActivityTemplateEvent extends Equatable {
  const ActivityTemplateEvent();

  @override
  List<Object> get props => [];
}

class AddActivityTemplateEvent extends ActivityTemplateEvent {
  final ActivityTemplate activityTemplate;

  const AddActivityTemplateEvent({
    required this.activityTemplate,
  });

  @override
  List<Object> get props => [activityTemplate];
}

class UpdateActivityTemplateEvent extends ActivityTemplateEvent {
  final ActivityTemplate activityTemplate;

  const UpdateActivityTemplateEvent({
    required this.activityTemplate,
  });

  @override
  List<Object> get props => [activityTemplate];
}

class DeleteActivityTemplateEvent extends ActivityTemplateEvent {
  final int activityTemplateId;

  const DeleteActivityTemplateEvent({
    required this.activityTemplateId,
  });

  @override
  List<Object> get props => [activityTemplateId];
}
