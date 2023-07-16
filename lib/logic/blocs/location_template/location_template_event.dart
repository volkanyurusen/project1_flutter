part of 'location_template_bloc.dart';

abstract class LocationTemplateEvent extends Equatable {
  const LocationTemplateEvent();

  @override
  List<Object> get props => [];
}

class AddLocationTemplateEvent extends LocationTemplateEvent {
  final LocationTemplate locationTemplate;

  const AddLocationTemplateEvent({
    required this.locationTemplate,
  });

  @override
  List<Object> get props => [locationTemplate];
}

class UpdateLocationTemplateEvent extends LocationTemplateEvent {
  final LocationTemplate locationTemplate;

  const UpdateLocationTemplateEvent({
    required this.locationTemplate,
  });

  @override
  List<Object> get props => [locationTemplate];
}

class DeleteLocationTemplateEvent extends LocationTemplateEvent {
  final int locationTemplateId;

  const DeleteLocationTemplateEvent({
    required this.locationTemplateId,
  });

  @override
  List<Object> get props => [locationTemplateId];
}
