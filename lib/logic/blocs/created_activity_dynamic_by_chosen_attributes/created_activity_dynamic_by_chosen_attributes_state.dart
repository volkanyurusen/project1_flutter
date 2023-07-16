part of 'created_activity_dynamic_by_chosen_attributes_bloc.dart';

class CreatedActivityDynamicByChosenAttributesState extends Equatable {
  final List<CreatedActivityDynamic> createdActivityDynamicList;
  final String error;
  final Status status;

  const CreatedActivityDynamicByChosenAttributesState({
    this.createdActivityDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  CreatedActivityDynamicByChosenAttributesState copyWith({
    List<CreatedActivityDynamic>? createdActivityDynamicList,
    String? error,
    Status? status,
  }) {
    return CreatedActivityDynamicByChosenAttributesState(
      createdActivityDynamicList:
          createdActivityDynamicList ?? this.createdActivityDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [createdActivityDynamicList, error, status];

  @override
  String toString() =>
      'CreatedActivityDynamicByChosenAttributesState(createdActivityDynamicList: $createdActivityDynamicList, error: $error, status: $status)';
}
