part of 'activity_type_dynamic_button_bloc.dart';

class ActivityTypeDynamicButtonState extends Equatable {
  final List<String> chosenActivityTypeDynamicList;

  const ActivityTypeDynamicButtonState({
    required this.chosenActivityTypeDynamicList,
  });

  ActivityTypeDynamicButtonState copyWith({
    List<String>? chosenActivityTypeDynamicList,
  }) =>
      ActivityTypeDynamicButtonState(
        chosenActivityTypeDynamicList: chosenActivityTypeDynamicList ?? this.chosenActivityTypeDynamicList,
      );
      
  @override
  List<Object> get props => [chosenActivityTypeDynamicList];
}


