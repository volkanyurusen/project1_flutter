part of 'text_of_address_on_personal_detail_editing_pop_up_bloc.dart';

abstract class TextOfAddressOnPersonalDetailEditingPopUpEvent
    extends Equatable {
  const TextOfAddressOnPersonalDetailEditingPopUpEvent();

  @override
  List<Object> get props => [];
}

class TextOfAddressOnPersonalDetailEditingPopUpSubmit
    extends TextOfAddressOnPersonalDetailEditingPopUpEvent {
  final String fieldText;

  const TextOfAddressOnPersonalDetailEditingPopUpSubmit(this.fieldText);

  @override
  List<Object> get props => [fieldText];
}

class TextOfAddressOnPersonalDetailEditingPopUpClear
    extends TextOfAddressOnPersonalDetailEditingPopUpEvent {}
