part of 'process_detail_dynamic_bloc.dart';

abstract class ProcessDetailDynamicEvent extends Equatable {
  const ProcessDetailDynamicEvent();

  @override
  List<Object> get props => [];
}

class LoadProcessDetailDynamicEvent extends ProcessDetailDynamicEvent {}
