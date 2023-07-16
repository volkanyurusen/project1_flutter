part of 'consisted_activity_dynamic_with_distance_by_created_activity_with_offset_bloc.dart';

class ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState
    extends Equatable {
  final List<ConsistedActivityDynamicWithDistance>
      consistedActivityDynamicWithDistanceList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState({
    this.consistedActivityDynamicWithDistanceList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState
      copyWith({
    List<ConsistedActivityDynamicWithDistance>?
        consistedActivityDynamicWithDistanceList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState(
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
      'ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetState(consistedActivityDynamicWithDistanceList: $consistedActivityDynamicWithDistanceList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
