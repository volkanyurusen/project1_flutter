part of 'text_of_city_on_personal_detail_editing_pop_up_bloc.dart';

abstract class TextOfCityOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const TextOfCityOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfCityOnPersonalDetailEditingPopUpSubmit
    extends TextOfCityOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextOfCityOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfCityOnPersonalDetailEditingPopUpClear
    extends TextOfCityOnPersonalDetailEditingPopUpEvent {}
