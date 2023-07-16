part of 'text_of_gender_on_personal_detail_editing_pop_up_bloc.dart';

abstract class TextOfGenderOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const TextOfGenderOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfGenderOnPersonalDetailEditingPopUpSubmit
    extends TextOfGenderOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextOfGenderOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfGenderOnPersonalDetailEditingPopUpClear
    extends TextOfGenderOnPersonalDetailEditingPopUpEvent {}
