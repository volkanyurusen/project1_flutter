part of 'text_of_country_on_personal_detail_editing_pop_up_bloc.dart';

abstract class TextOfCountryOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const TextOfCountryOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfCountryOnPersonalDetailEditingPopUpSubmit
    extends TextOfCountryOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextOfCountryOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfCountryOnPersonalDetailEditingPopUpClear
    extends TextOfCountryOnPersonalDetailEditingPopUpEvent {}
