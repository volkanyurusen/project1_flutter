part of 'result_of_preferred_activity_dynamic_bloc.dart';

abstract class ResultOfPreferredActivityDynamicEvent extends Equatable {
  const ResultOfPreferredActivityDynamicEvent();

  @override
  List<Object> get props => [];
}

class LoadResultOfPreferredActivityDynamic
    extends ResultOfPreferredActivityDynamicEvent {
  final int uId;
  final String activityTitle;
  final double locationCircularDiamter;
  final double lat;
  final double lon;
  final int offset;

  const LoadResultOfPreferredActivityDynamic({
    required this.uId,
    required this.activityTitle,
    required this.locationCircularDiamter,
    required this.lat,
    required this.lon,
    this.offset = 0,
  });

  @override
  List<Object> get props =>
      [uId, activityTitle, locationCircularDiamter, lat, lon, offset];
}

class CleanResultOfPreferredActivityDynamic
    extends ResultOfPreferredActivityDynamicEvent {}

// class RecallResultOfPreferredActivityDynamic
//     extends ResultOfPreferredActivityDynamicEvent {}
