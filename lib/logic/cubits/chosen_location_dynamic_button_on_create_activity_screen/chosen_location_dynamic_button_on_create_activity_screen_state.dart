part of 'chosen_location_dynamic_button_on_create_activity_screen_cubit.dart';

class ChosenLocationDetailDynamicButtonOnCreateActivityScreenState
    extends Equatable {
  final List<LocationDetailDynamic> chosenLocationDetailDynamicList;

  const ChosenLocationDetailDynamicButtonOnCreateActivityScreenState({
    this.chosenLocationDetailDynamicList = const [],
  });

  @override
  List<Object?> get props => [chosenLocationDetailDynamicList];

  ChosenLocationDetailDynamicButtonOnCreateActivityScreenState copyWith({
    List<LocationDetailDynamic>? chosenLocationDetailDynamicList,
  }) {
    return ChosenLocationDetailDynamicButtonOnCreateActivityScreenState(
      chosenLocationDetailDynamicList: chosenLocationDetailDynamicList ??
          this.chosenLocationDetailDynamicList,
    );
  }

  @override
  String toString() =>
      'ChosenLocationDetailDynamicButtonOnCreateActivityScreenState(chosenLocationDetailDynamicList: $chosenLocationDetailDynamicList)';
}
