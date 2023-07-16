part of 'created_activity_dynamic_with_distance_created_by_user_bloc.dart';

class CreatedActivityDynamicWithDistanceCreatedByUserState extends Equatable {
  final List<CreatedActivityDynamicWithDistance>
      createdActivityDynamicWithDistanceList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const CreatedActivityDynamicWithDistanceCreatedByUserState({
    this.createdActivityDynamicWithDistanceList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  CreatedActivityDynamicWithDistanceCreatedByUserState copyWith({
    List<CreatedActivityDynamicWithDistance>?
        createdActivityDynamicWithDistanceList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return CreatedActivityDynamicWithDistanceCreatedByUserState(
      createdActivityDynamicWithDistanceList:
          createdActivityDynamicWithDistanceList ??
              this.createdActivityDynamicWithDistanceList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [createdActivityDynamicWithDistanceList, error, status, hasReachedMax];

  @override
  String toString() =>
      'CreatedActivityDynamicWithDistanceCreatedByUserState(createdActivityDynamicWithDistanceList: $createdActivityDynamicWithDistanceList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
