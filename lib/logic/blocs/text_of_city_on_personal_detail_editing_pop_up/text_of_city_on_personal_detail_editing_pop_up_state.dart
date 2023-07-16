part of 'text_of_city_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class TextOfCityOnPersonalDetailEditingPopUpState extends Equatable {
//   const TextOfCityOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfCityOnPersonalDetailEditingPopUpState extends Equatable {
  final String? city;

  const TextOfCityOnPersonalDetailEditingPopUpState({this.city = ''});

  TextOfCityOnPersonalDetailEditingPopUpState copyWith({String? city}) {
    return TextOfCityOnPersonalDetailEditingPopUpState(
        city: city ?? this.city);
  }

  @override
  List<Object?> get props => [city!];

  @override
  String toString() =>
      'TextOfCityOnPersonalDetailEditingPopUpState(city: $city)';
}
