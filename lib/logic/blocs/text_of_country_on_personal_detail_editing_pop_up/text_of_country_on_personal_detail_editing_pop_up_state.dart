part of 'text_of_country_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class TextOfCountryOnPersonalDetailEditingPopUpState extends Equatable {
//   const TextOfCountryOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfCountryOnPersonalDetailEditingPopUpState extends Equatable {
  final String? country;

  const TextOfCountryOnPersonalDetailEditingPopUpState({this.country = ''});

  TextOfCountryOnPersonalDetailEditingPopUpState copyWith({String? country}) {
    return TextOfCountryOnPersonalDetailEditingPopUpState(
        country: country ?? this.country);
  }

  @override
  List<Object?> get props => [country!];

  @override
  String toString() =>
      'TextOfCountryOnPersonalDetailEditingPopUpState(country: $country)';
}
