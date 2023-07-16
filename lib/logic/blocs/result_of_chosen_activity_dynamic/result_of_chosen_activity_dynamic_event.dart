part of 'result_of_chosen_activity_dynamic_bloc.dart';

abstract class ResultOfChosenActivityDynamicEvent extends Equatable {
  const ResultOfChosenActivityDynamicEvent();

  @override
  List<Object> get props => [];
}

class LoadResultOfChosenActivityDynamic
    extends ResultOfChosenActivityDynamicEvent {
  final int uId;
  final List activityTypeDetailList;
  final List activityTitleList;
  final double locationCircularDiamter;
  final double lat;
  final double lon;
  final int offset;

  const LoadResultOfChosenActivityDynamic({
    required this.uId,
    required this.activityTypeDetailList,
    required this.activityTitleList,
    required this.locationCircularDiamter,
    required this.lat,
    required this.lon,
    this.offset = 0,
  });

  @override
  List<Object> get props => [
        uId,
        activityTypeDetailList,
        activityTitleList,
        locationCircularDiamter,
        lat,
        lon,
        offset
      ];
}

class CleanResultOfChosenActivityDynamic
    extends ResultOfChosenActivityDynamicEvent {}

// class RecallResultOfChosenActivityDynamic
//     extends ResultOfChosenActivityDynamicEvent {}
