part of 'gender_dynamic_bloc.dart';

abstract class GenderDynamicEvent extends Equatable {
  const GenderDynamicEvent();

  @override
  List<Object> get props => [];
}

class LoadGenderDynamicEvent extends GenderDynamicEvent {}
