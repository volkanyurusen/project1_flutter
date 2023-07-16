part of 'created_activity_dynamic_by_host_bloc.dart';

class CreatedActivityDynamicByHostState extends Equatable {
  final List<CreatedActivityDynamic> createdActivityDynamicList;
  final String error;
  final StatusWithoutLoading status;
  final bool hasReachedMax;

  const CreatedActivityDynamicByHostState({
    this.createdActivityDynamicList = const [],
    this.error = '',
    this.status = StatusWithoutLoading.initial,
    this.hasReachedMax = false,
  });

  CreatedActivityDynamicByHostState copyWith({
    List<CreatedActivityDynamic>? createdActivityDynamicList,
    String? error,
    StatusWithoutLoading? status,
    bool? hasReachedMax,
  }) {
    return CreatedActivityDynamicByHostState(
      createdActivityDynamicList:
          createdActivityDynamicList ?? this.createdActivityDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props =>
      [createdActivityDynamicList, error, status, hasReachedMax];

  @override
  String toString() =>
      'CreatedActivityDynamicByHostState(createdActivityDynamicList: $createdActivityDynamicList, error: $error, status: $status, hasReachedMax: $hasReachedMax)';
}
