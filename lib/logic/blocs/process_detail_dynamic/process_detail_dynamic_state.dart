part of 'process_detail_dynamic_bloc.dart';

class ProcessDetailDynamicState extends Equatable {
  final List<ProcessDetailDynamic> processDetailDynamicList;
  final String error;
  final Status status;

  const ProcessDetailDynamicState({
    this.processDetailDynamicList = const [],
    this.error = '',
    this.status = Status.initial,
  });

  ProcessDetailDynamicState copyWith({
    List<ProcessDetailDynamic>? processDetailDynamicList,
    String? error,
    Status? status,
  }) {
    return ProcessDetailDynamicState(
      processDetailDynamicList: processDetailDynamicList ?? this.processDetailDynamicList,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [processDetailDynamicList, error, status];

  @override
  String toString() =>
      'ProcessDetailDynamicState(processDetailDynamicList: $processDetailDynamicList, error: $error, status: $status)';
}
