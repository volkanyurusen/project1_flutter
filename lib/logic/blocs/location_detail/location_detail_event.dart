part of 'location_detail_bloc.dart';

abstract class LocationDetailEvent extends Equatable {
  const LocationDetailEvent();

  @override
  List<Object> get props => [];
}

class AddLocationDetailEvent extends LocationDetailEvent {
  final LocationDetail locationDetail;

  const AddLocationDetailEvent({
    required this.locationDetail,
  });

  @override
  List<Object> get props => [locationDetail];
}
