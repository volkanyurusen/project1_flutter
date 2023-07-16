part of 'dropdown_button_cubit.dart';

abstract class DropdownButtonState extends Equatable {
  const DropdownButtonState();

  @override
  List<Object?> get props => [];
}

class DropdownButtonInitialState extends DropdownButtonState {}

class DropdownButtonChoiceChanged extends DropdownButtonState {}
