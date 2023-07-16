part of 'result_of_preferred_activity_dynamic_bloc.dart';

class ResultOfPreferredActivityDynamicState extends Equatable {
  final List<ActivityTile>
      resultOfPreferredActivityDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;
  final bool hasNewAttendance;

  const ResultOfPreferredActivityDynamicState({
    this.resultOfPreferredActivityDynamicList =
        const <ActivityTile>[],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
    this.hasNewAttendance = false,
  });

  ResultOfPreferredActivityDynamicState copyWith({
    List<ActivityTile>?
        resultOfPreferredActivityDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
    bool? hasNewAttendance,
  }) {
    return ResultOfPreferredActivityDynamicState(
      resultOfPreferredActivityDynamicList:
          resultOfPreferredActivityDynamicList ??
              this.resultOfPreferredActivityDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      hasNewAttendance: hasNewAttendance ?? this.hasNewAttendance,
    );
  }

  @override
  List<Object?> get props => [
        resultOfPreferredActivityDynamicList,
        error,
        status,
        hasReachedMax,
        hasNewAttendance,
      ];

  @override
  String toString() =>
      'ResultOfPreferredActivityDynamicState(resultOfPreferredActivityDynamicList: $resultOfPreferredActivityDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax, hasNewAttendance: $hasNewAttendance))';
}
