part of 'consisted_activity_dynamic_with_distance_attended_by_user_bloc.dart';

class ConsistedActivityDynamicWithDistanceAttendedByUserState
    extends Equatable {
  final List<ConsistedActivityDynamicWithDistance>
      consistedActivityDynamicWithDistanceList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const ConsistedActivityDynamicWithDistanceAttendedByUserState({
    this.consistedActivityDynamicWithDistanceList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  ConsistedActivityDynamicWithDistanceAttendedByUserState copyWith({
    List<ConsistedActivityDynamicWithDistance>?
        consistedActivityDynamicWithDistanceList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return ConsistedActivityDynamicWithDistanceAttendedByUserState(
      consistedActivityDynamicWithDistanceList:
          consistedActivityDynamicWithDistanceList ??
              this.consistedActivityDynamicWithDistanceList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [consistedActivityDynamicWithDistanceList, error, status, hasReachedMax];

  @override
  String toString() =>
      'ConsistedActivityDynamicWithDistanceAttendedByUserState(consistedActivityDynamicWithDistanceList: $consistedActivityDynamicWithDistanceList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
