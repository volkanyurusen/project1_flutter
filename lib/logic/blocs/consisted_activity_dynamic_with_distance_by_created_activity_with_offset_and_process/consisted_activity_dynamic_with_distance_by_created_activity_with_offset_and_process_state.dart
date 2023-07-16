part of 'consisted_activity_dynamic_with_distance_by_created_activity_with_offset_and_process_bloc.dart';

class ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
    extends Equatable {
  final List<ConsistedActivityDynamicWithDistance>
      consistedActivityDynamicWithDistanceList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState({
    this.consistedActivityDynamicWithDistanceList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState
      copyWith({
    List<ConsistedActivityDynamicWithDistance>?
        consistedActivityDynamicWithDistanceList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState(
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
      'ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessState(consistedActivityDynamicWithDistanceList: $consistedActivityDynamicWithDistanceList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
