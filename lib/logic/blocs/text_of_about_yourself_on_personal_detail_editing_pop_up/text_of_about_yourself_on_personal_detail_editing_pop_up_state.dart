part of 'text_of_about_yourself_on_personal_detail_editing_pop_up_bloc.dart';

// abstract class TextOfAboutYourselfOnPersonalDetailEditingPopUpState extends Equatable {
//   const TextOfAboutYourselfOnPersonalDetailEditingPopUpState();

//   @override
//   List<Object> get props => [];
// }

class TextOfAboutYourselfOnPersonalDetailEditingPopUpState extends Equatable {
  final String? aboutYourself;

  const TextOfAboutYourselfOnPersonalDetailEditingPopUpState({this.aboutYourself = ''});

  TextOfAboutYourselfOnPersonalDetailEditingPopUpState copyWith({String? aboutYourself}) {
    return TextOfAboutYourselfOnPersonalDetailEditingPopUpState(
        aboutYourself: aboutYourself ?? this.aboutYourself);
  }

  @override
  List<Object?> get props => [aboutYourself!];

  @override
  String toString() =>
      'TextOfAboutYourselfOnPersonalDetailEditingPopUpState(aboutYourself: $aboutYourself)';
}
