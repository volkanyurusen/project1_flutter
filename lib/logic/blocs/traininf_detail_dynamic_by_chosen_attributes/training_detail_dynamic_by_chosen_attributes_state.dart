part of 'training_detail_dynamic_by_chosen_attributes_bloc.dart';

class TrainingDetailDynamicByChosenAttributesState extends Equatable {
  final List<TrainingDetailDynamic> trainingDetailDynamicList;
  final String error;
  final Status status;

  const TrainingDetailDynamicByChosenAttributesState({
    this.trainingDetailDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  TrainingDetailDynamicByChosenAttributesState copyWith({
    List<TrainingDetailDynamic>? trainingDetailDynamicList,
    String? error,
    Status? status,
  }) {
    return TrainingDetailDynamicByChosenAttributesState(
      trainingDetailDynamicList:
          trainingDetailDynamicList ?? this.trainingDetailDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [trainingDetailDynamicList, error, status];

  @override
  String toString() =>
      'TrainingDetailDynamicByChosenAttributesState(trainingDetailDynamicList: $trainingDetailDynamicList, error: $error, status: $status)';
}
