part of 'text_of_address_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class TextOfAddressOnPersonalDetailEditingPopUpState extends Equatable {
//   const TextOfAddressOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfAddressOnPersonalDetailEditingPopUpState extends Equatable {
  final String? address;

  const TextOfAddressOnPersonalDetailEditingPopUpState({this.address = ''});

  TextOfAddressOnPersonalDetailEditingPopUpState copyWith({String? address}) {
    return TextOfAddressOnPersonalDetailEditingPopUpState(
        address: address ?? this.address);
  }

  @override
  List<Object?> get props => [address!];

  @override
  String toString() =>
      'TextOfAddressOnPersonalDetailEditingPopUpState(address: $address)';
}
