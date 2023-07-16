part of 'clean_all_button_cubit.dart';

abstract class CleanAllButtonState extends Equatable {
  const CleanAllButtonState();

  @override
  List<Object?> get props => [];
}

class CleanAllButtonInitialState extends CleanAllButtonState {}

class CleanAllButtonClicked extends CleanAllButtonState {}
