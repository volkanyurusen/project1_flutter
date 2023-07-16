part of 'result_of_chosen_activity_dynamic_bloc.dart';

class ResultOfChosenActivityDynamicState extends Equatable {
  final List<CreatedActivityDynamicWithDistance>
      resultOfChosenActivityDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;
  final bool hasNewAttendance;

  const ResultOfChosenActivityDynamicState({
    this.resultOfChosenActivityDynamicList =
        const <CreatedActivityDynamicWithDistance>[],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
    this.hasNewAttendance = false,
  });

  ResultOfChosenActivityDynamicState copyWith({
    List<CreatedActivityDynamicWithDistance>? resultOfChosenActivityDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
    bool? hasNewAttendance,
  }) {
    return ResultOfChosenActivityDynamicState(
      resultOfChosenActivityDynamicList: resultOfChosenActivityDynamicList ??
          this.resultOfChosenActivityDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      hasNewAttendance: hasNewAttendance ?? this.hasNewAttendance,
    );
  }

  @override
  List<Object?> get props => [
        resultOfChosenActivityDynamicList,
        error,
        status,
        hasReachedMax,
        hasNewAttendance,
      ];

  @override
  String toString() =>
      'ResultOfChosenActivityDynamicState(resultOfChosenActivityDynamicList: $resultOfChosenActivityDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax, hasNewAttendance: $hasNewAttendance))';
}
