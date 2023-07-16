import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/model_dbs.dart';
import 'package:my_project/widgets/widget.dart';

class PersonalDetailsEditingPopUpCancelAndUpdateButtonArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppFeedbacks _appFeedbacks = AppFeedbacks();
  final UserBloc userBloc;
  final UserDynamicBloc userDynamicBloc;

  PersonalDetailsEditingPopUpCancelAndUpdateButtonArea({
    required this.userBloc,
    required this.userDynamicBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _createButtonArea(context);
  }

  /// CREATE ==========================================================================================================
  CustomColumn _createButtonArea(BuildContext context) =>
      CustomColumn(children: [
        _createCancelAndUpdatedButtonArea(context),
        const CustomAppSizedBox(),
      ]);

  CustomRow _createCancelAndUpdatedButtonArea(BuildContext context) =>
      CustomRow(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(flex: 1, child: _displayCancelButton(context)),
          const CustomAppSizedBox(width: 18),
          Flexible(flex: 1, child: _buildUpdateButton(context)),
        ],
      );

  /// CANCEL BUTTON ====================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// DISPLAY ==========================================================================================================
  CustomElevatedButton _displayCancelButton(BuildContext context) =>
      CustomElevatedButton(
          buttonColor: _appColors.unselectedButtonColor,
          textlabel: 'Cancel',
          onPressed: () {
            _clickCancelButton(context);
          });

  /// METHODS ==========================================================================================================
  /// Cancel Button ----------------------------------------------------------------------------------------------------
  void _clickCancelButton(BuildContext context) {
    if (_checkNameSurnameFilledUp(context)) {
      _submitNameSurnameField(context);
    }
    if (_checkUsernameFilledUp(context)) {
      _submitUsernameField(context);
    }
    if (_checkBirthyearFilledUp(context)) {
      _submitBirthyearField(context);
    }
    if (_checkGenderIsChosen(context)) {
      _submitGenderDropbox(context);
    }
    if (_checkEmailFilledUp(context)) {
      _submitEmailField(context);
    }
    if (_checkAddressFilledUp(context)) {
      _submitAddressField(context);
    }
    if (_checkCityIsChosen(context)) {
      _submitCityDropbox(context);
    }
    if (_checkCountryIsChosen(context)) {
      _submitCountryDropbox(context);
    }
    if (_checkAboutYourselfFilledUp(context)) {
      _submitAboutYourselfField(context);
    }
    _closePopUp(context);
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkNameSurnameFilledUp(
    BuildContext context,
  ) =>
      context
          .read<TextOfNameSurnameOnPersonalDetailEditingPopUpBloc>()
          .state
          .nameSurname !=
      '';

  bool _checkUsernameFilledUp(BuildContext context) =>
      context
          .read<TextOfUsernameOnPersonalDetailEditingPopUpBloc>()
          .state
          .username !=
      '';

  bool _checkBirthyearFilledUp(BuildContext context) =>
      context
          .read<TextOfBirthyearOnPersonalDetailEditingPopUpBloc>()
          .state
          .birthyear !=
      '';

  bool _checkGenderIsChosen(BuildContext context) =>
      context
          .read<TextOfGenderOnPersonalDetailEditingPopUpBloc>()
          .state
          .gender !=
      '';

  bool _checkEmailFilledUp(BuildContext context) =>
      context.read<TextOfEmailOnPersonalDetailEditingPopUpBloc>().state.email !=
      '';

  bool _checkAddressFilledUp(BuildContext context) =>
      context
          .read<TextOfAddressOnPersonalDetailEditingPopUpBloc>()
          .state
          .address !=
      '';

  bool _checkCityIsChosen(BuildContext context) =>
      context.read<TextOfCityOnPersonalDetailEditingPopUpBloc>().state.city !=
      '';

  bool _checkCountryIsChosen(BuildContext context) =>
      context
          .read<TextOfCountryOnPersonalDetailEditingPopUpBloc>()
          .state
          .country !=
      '';

  bool _checkAboutYourselfFilledUp(BuildContext context) =>
      context
          .read<TextOfAboutYourselfOnPersonalDetailEditingPopUpBloc>()
          .state
          .aboutYourself !=
      '';

  /// UPDATED BUTTON ===================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// ==================================================================================================================
  /// BUILD ============================================================================================================
  BlocBuilder _buildUpdateButton(BuildContext context) => BlocBuilder<
          TextOfNameSurnameOnPersonalDetailEditingPopUpBloc,
          TextOfNameSurnameOnPersonalDetailEditingPopUpState>(
        builder: (context, state) {
          return BlocBuilder<TextOfUsernameOnPersonalDetailEditingPopUpBloc,
              TextOfUsernameOnPersonalDetailEditingPopUpState>(
            builder: (context, state) {
              return BlocBuilder<
                  TextOfBirthyearOnPersonalDetailEditingPopUpBloc,
                  TextOfBirthyearOnPersonalDetailEditingPopUpState>(
                builder: (context, state) {
                  return BlocBuilder<
                      TextOfGenderOnPersonalDetailEditingPopUpBloc,
                      TextOfGenderOnPersonalDetailEditingPopUpState>(
                    builder: (context, state) {
                      return BlocBuilder<
                          TextOfEmailOnPersonalDetailEditingPopUpBloc,
                          TextOfEmailOnPersonalDetailEditingPopUpState>(
                        builder: (context, state) {
                          return BlocBuilder<
                              TextOfAddressOnPersonalDetailEditingPopUpBloc,
                              TextOfAddressOnPersonalDetailEditingPopUpState>(
                            builder: (context, state) {
                              return BlocBuilder<
                                  TextOfCityOnPersonalDetailEditingPopUpBloc,
                                  TextOfCityOnPersonalDetailEditingPopUpState>(
                                builder: (context, state) {
                                  return BlocBuilder<
                                      TextOfCountryOnPersonalDetailEditingPopUpBloc,
                                      TextOfCountryOnPersonalDetailEditingPopUpState>(
                                    builder: (context, state) {
                                      return BlocBuilder<
                                              TextOfAboutYourselfOnPersonalDetailEditingPopUpBloc,
                                              TextOfAboutYourselfOnPersonalDetailEditingPopUpState>(
                                          builder: (context, state) =>
                                              _displayUpdateButton(context));
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          );
        },
      );

  /// DISPLAY ==========================================================================================================
  CustomElevatedButton _displayUpdateButton(BuildContext context) =>
      CustomElevatedButton(
        buttonColor: _appColors.secondary,
        textlabel: 'Update',
        onPressed: _checkWhetherNameSurnameIsUpdated(context) ||
                _checkWhetherUsernameIsUpdated(context) ||
                _checkWhetherBirthyearIsUpdated(context) ||
                _checkWhetherGenderIsUpdated(context) ||
                _checkWhetherEmailIsUpdated(context) ||
                _checkWhetherAddressIsUpdated(context) ||
                _checkWhetherCityIsUpdated(context) ||
                _checkWhetherCountryIsUpdated(context) ||
                _checkWhetherAboutYourselfIsUpdated(context)
            ? () {
                _clickUpdateButton(context);
              }
            : null,
      );

  /// METHODS ==========================================================================================================
  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherNameSurnameIsUpdated(BuildContext context) =>
      (_findTextOfNameSurname(context) != _findUserNameSurname(context) &&
          _findTextfieldOfNameSurname(context) !=
              _findUserNameSurname(context));

  bool _checkWhetherUsernameIsUpdated(BuildContext context) =>
      (_findTextOfUsername(context) != _findUserUsername(context) &&
          _findTextfieldOfUsername(context) != _findUserUsername(context));

  bool _checkWhetherBirthyearIsUpdated(BuildContext context) =>
      (_findTextOfBirthyear(context) != _findUserBirthyear(context) &&
          _findTextfieldOfBirthyear(context) != _findUserBirthyear(context));

  bool _checkWhetherGenderIsUpdated(BuildContext context) =>
      (_findTextOfGender(context) != _findUserGender(context) &&
          _findTextfieldOfGender(context) != _findUserGender(context));

  bool _checkWhetherEmailIsUpdated(BuildContext context) =>
      (_findTextOfEmail(context) != _findUserEmail(context) &&
          _findTextfieldOfEmail(context) != _findUserEmail(context));

  bool _checkWhetherAddressIsUpdated(BuildContext context) =>
      (_findTextOfAddress(context) != _findUserAddress(context) &&
          _findTextfieldOfAddress(context) != _findUserAddress(context));

  bool _checkWhetherCityIsUpdated(BuildContext context) =>
      (_findTextOfCity(context) != _findUserCity(context) &&
          _findTextfieldOfCity(context) != _findUserCity(context));

  bool _checkWhetherCountryIsUpdated(BuildContext context) =>
      (_findTextOfCountry(context) != _findUserCountry(context) &&
          _findTextfieldOfCountry(context) != _findUserCountry(context));

  bool _checkWhetherAboutYourselfIsUpdated(BuildContext context) =>
      (_findTextOfAboutYourself(context) != _findUserAboutYourself(context) &&
          _findTextfieldOfAboutYourself(context) !=
              _findUserAboutYourself(context));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String? _findTextOfNameSurname(BuildContext context) => context
      .read<TextOfNameSurnameOnPersonalDetailEditingPopUpBloc>()
      .state
      .nameSurname;

  String? _findTextfieldOfNameSurname(BuildContext context) => context
      .read<TextFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc>()
      .state
      .fieldText;

  String _findUserNameSurname(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.nameSurname;

  String _findTextOfUsername(BuildContext context) => context
      .read<TextOfUsernameOnPersonalDetailEditingPopUpBloc>()
      .state
      .username!;

  String _findTextfieldOfUsername(BuildContext context) => context
      .read<TextFieldOfUsernameOnPersonalDetailEditingPopUpBloc>()
      .state
      .fieldText!;

  String _findTextOfBirthyear(BuildContext context) => context
      .read<TextOfBirthyearOnPersonalDetailEditingPopUpBloc>()
      .state
      .birthyear!;

  String _findTextfieldOfBirthyear(BuildContext context) => context
      .read<TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc>()
      .state
      .fieldText!;

  String _findTextOfGender(BuildContext context) => context
      .read<TextOfGenderOnPersonalDetailEditingPopUpBloc>()
      .state
      .gender!;

  String _findTextfieldOfGender(BuildContext context) => context
      .read<DropdownOfGenderOnPersonalDetailEditingPopUpBloc>()
      .state
      .fieldText!;

  String _findTextOfEmail(BuildContext context) =>
      context.read<TextOfEmailOnPersonalDetailEditingPopUpBloc>().state.email!;

  String _findTextfieldOfEmail(BuildContext context) => context
      .read<TextFieldOfEmailOnPersonalDetailEditingPopUpBloc>()
      .state
      .fieldText!;

  String _findTextOfAddress(BuildContext context) => context
      .read<TextOfAddressOnPersonalDetailEditingPopUpBloc>()
      .state
      .address!;

  String _findTextfieldOfAddress(BuildContext context) => context
      .read<TextFieldOfAddressOnPersonalDetailEditingPopUpBloc>()
      .state
      .fieldText!;

  String _findTextOfCity(BuildContext context) =>
      context.read<TextOfCityOnPersonalDetailEditingPopUpBloc>().state.city!;

  String _findTextfieldOfCity(BuildContext context) => context
      .read<DropdownOfCityOnPersonalDetailEditingPopUpBloc>()
      .state
      .fieldText!;

  String _findUserCity(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.countryCity.city.cityDetail;

  String _findTextOfCountry(BuildContext context) => context
      .read<TextOfCountryOnPersonalDetailEditingPopUpBloc>()
      .state
      .country!;

  String _findTextfieldOfCountry(BuildContext context) => context
      .read<DropdownOfCountryOnPersonalDetailEditingPopUpBloc>()
      .state
      .fieldText!;

  String _findUserCountry(BuildContext context) => context
      .read<UserBloc>()
      .state
      .userList
      .last
      .countryCity
      .country
      .countryDetail;

  String _findTextOfAboutYourself(BuildContext context) => context
      .read<TextOfAboutYourselfOnPersonalDetailEditingPopUpBloc>()
      .state
      .aboutYourself!;

  String _findTextfieldOfAboutYourself(BuildContext context) => context
      .read<TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc>()
      .state
      .fieldText!;

  /// METHODS ==========================================================================================================
  void _clickUpdateButton(BuildContext context) {
    if (_checkNameSurnameNotFilledUp(context)) {
      _displayDialogAboutDeficientNameSurname(context);
    } else if (_checkUsernameNotFilledUp(context)) {
      _displayDialogAboutDeficientUsername(context);
    } else if (_checkBirthyearNotFilledUp(context)) {
      _displayDialogAboutBirthyear(context);
    } else if (_checkGenderIsNotChosen(context)) {
      _displayDialogAboutDeficientGender(context);
    } else if (_checkEmailNotFilledUp(context)) {
      _displayDialogAboutDeficientEmail(context);
    } else if (_checkAddressNotFilledUp(context)) {
      _displayDialogAboutDeficientAddress(context);
    } else if (_checkCityIsNotChosen(context)) {
      _displayDialogAboutDeficientCity(context);
    } else if (_checkCountryIsNotChosen(context)) {
      _displayDialogAboutDeficientCountry(context);
    } else if (_checkAboutYourselfNotFilledUp(context)) {
      _displayDialogAboutDeficientAboutYourself(context);
    } else {
      _startUpdatingProcess(context);
    }
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkNameSurnameNotFilledUp(BuildContext context) =>
      context
          .read<TextOfNameSurnameOnPersonalDetailEditingPopUpBloc>()
          .state
          .nameSurname ==
      '';

  bool _checkUsernameNotFilledUp(BuildContext context) =>
      context
          .read<TextOfUsernameOnPersonalDetailEditingPopUpBloc>()
          .state
          .username ==
      '';

  bool _checkBirthyearNotFilledUp(BuildContext context) =>
      context
          .read<TextOfBirthyearOnPersonalDetailEditingPopUpBloc>()
          .state
          .birthyear ==
      '';

  bool _checkGenderIsNotChosen(BuildContext context) =>
      context
          .read<TextOfGenderOnPersonalDetailEditingPopUpBloc>()
          .state
          .gender ==
      '';

  bool _checkEmailNotFilledUp(BuildContext context) =>
      context.read<TextOfEmailOnPersonalDetailEditingPopUpBloc>().state.email ==
      '';

  bool _checkAddressNotFilledUp(BuildContext context) =>
      context
          .read<TextOfAddressOnPersonalDetailEditingPopUpBloc>()
          .state
          .address ==
      '';

  bool _checkCityIsNotChosen(BuildContext context) =>
      context.read<TextOfCityOnPersonalDetailEditingPopUpBloc>().state.city ==
      '';

  bool _checkCountryIsNotChosen(BuildContext context) =>
      context
          .read<TextOfCountryOnPersonalDetailEditingPopUpBloc>()
          .state
          .country ==
      '';

  bool _checkAboutYourselfNotFilledUp(BuildContext context) =>
      context
          .read<TextOfAboutYourselfOnPersonalDetailEditingPopUpBloc>()
          .state
          .aboutYourself ==
      '';

  /// Display Dialogs --------------------------------------------------------------------------------------------------
  Future<dynamic> _displayDialogAboutDeficientNameSurname(
          BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutEmptyNameSurname);

  Future<dynamic> _displayDialogAboutDeficientUsername(BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutEmptyUsername);

  Future<dynamic> _displayDialogAboutBirthyear(BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutEmptyBirthyear);

  Future<dynamic> _displayDialogAboutDeficientGender(BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutMissingOneGenderChoice);

  Future<dynamic> _displayDialogAboutDeficientEmail(BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutEmptyEmail);

  Future<dynamic> _displayDialogAboutDeficientAddress(BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutEmptyAddress);

  Future<dynamic> _displayDialogAboutDeficientCity(BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutMissingOneCityChoice);

  Future<dynamic> _displayDialogAboutDeficientCountry(BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutMissingOneCountryChoice);

  Future<dynamic> _displayDialogAboutDeficientAboutYourself(
          BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutEmptyAboutYourself);

  /// UPDATING PROCESS -------------------------------------------------------------------------------------------------
  void _startUpdatingProcess(BuildContext context) {
    _bringChosenCountryCityDetailFromDB(context);
    showDialog(
        context: context,
        builder: (context) {
          return BlocListener<CountryCityDynamicByChosenAttributesBloc,
              CountryCityDynamicByChosenAttributesState>(
            listenWhen: (previous, current) =>
                _checkWhetherCountryCityUpdatingSuccessfully(current),
            listener: (context, state) {
              _initiateUpdatingProcess(context, userBloc, userDynamicBloc);
              int pageCount = 0;
              Future.delayed(AppTimeConstants().timeOutDuration, () {
                _closeUpdatingPopUp(context, pageCount);
              });
            },
            child: BlocBuilder<CountryCityDynamicByChosenAttributesBloc,
                CountryCityDynamicByChosenAttributesState>(
              builder: (context, state) {
                switch (state.status) {
                  case Status.initial:
                    return DBProcessLoader();
                  case Status.loading:
                    return DBProcessLoader();
                  case Status.success:
                    return DBProcessLoader();
                  case Status.failure:
                    return StateError(error: state.error);
                }
              },
            ),
          );
        });
  }

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherCountryCityUpdatingSuccessfully(
          CountryCityDynamicByChosenAttributesState current) =>
      current.status == Status.success;

  /// Initiate Process Method ------------------------------------------------------------------------------------------
  void _initiateUpdatingProcess(
    BuildContext context,
    UserBloc userBloc,
    UserDynamicBloc userDynamicBloc,
  ) {
    UserDB userDB = _createUserDBInstance(context);
    _updateUserIntoDB(context, userDB);
    _changeUserState(context, userBloc, userDynamicBloc);
    _bringUserFromDB(context, userBloc, userDynamicBloc);
    // ? The below code block relocated up in BlocListener because the otherwise (just for a while but still) gave an error and empty template information!!!
    //
    // _cleanAllButton(context);
    // int pageCount = 0;
    // _closeAddingPopUp(context, pageCount);
  }

  /// State Changing Methods -------------------------------------------------------------------------------------------
  void _changeUserState(
    BuildContext context,
    UserBloc userBloc,
    UserDynamicBloc userDynamicBloc,
  ) {
    userBloc.add(RecallUserEvent());
    userDynamicBloc.add(RecallUserDynamicEvent());
    //
    // context.read<UserBloc>().add(RecallUserEvent());
    // context.read<UserDynamicBloc>().add(RecallUserDynamicEvent());
  }

  /// Create Model Instance --------------------------------------------------------------------------------------------
  UserDB _createUserDBInstance(BuildContext context) {
    final UserDB userDB = UserDB(
      userDBId: _findUserId,
      username: _findUsername(context),
      nameSurname: _findNameSurname(context),
      email: _findEmail(context),
      address: _findAddress(context),
      birthyear: _findBirthyear(context),
      genderId: _findGender(context),
      countryCityId: _findCountryCityId(context),
      picUrl: _findPicUrl(context),
      aboutUser: _findAboutUser(context),
      isUnderAge: _findIsUnderAge(context),
      lat: _findLat(context),
      lon: _findLon(context),
      verificationCode: _findVerificationCode(context),
      membershipTypeId: _findMembershipTypeId(context),
      updatedAt: DateTime.now(),
      isActive: true,
    );
    return userDB;
  }

  /// Find Mehtods -----------------------------------------------------------------------------------------------------
  String _findNameSurname(BuildContext context) => context
      .read<TextOfNameSurnameOnPersonalDetailEditingPopUpBloc>()
      .state
      .nameSurname!;

  String _findEmail(BuildContext context) =>
      context.read<TextOfEmailOnPersonalDetailEditingPopUpBloc>().state.email!;

  String _findAddress(BuildContext context) => context
      .read<TextOfAddressOnPersonalDetailEditingPopUpBloc>()
      .state
      .address!;

  int _findBirthyear(BuildContext context) => int.parse(context
      .read<TextOfBirthyearOnPersonalDetailEditingPopUpBloc>()
      .state
      .birthyear!);

  int _findGender(BuildContext context) => context
      .read<GenderDynamicBloc>()
      .state
      .genderDynamicList
      .where((element) => element.genderDetail == _findChosenGender(context))
      .first
      .genderId!;

  int _findCountryCityId(BuildContext context) => context
      .read<CountryCityDynamicByChosenAttributesBloc>()
      .state
      .countryCityDynamicList
      .last
      .countryCityId!;

  String _findPicUrl(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.picUrl;

  String _findAboutUser(BuildContext context) => context
      .read<TextOfAboutYourselfOnPersonalDetailEditingPopUpBloc>()
      .state
      .aboutYourself!;

  bool _findIsUnderAge(BuildContext context) =>
      (DateTime.now().year - int.parse(_findChosenBirthyear(context)) >=
              _appNumberConstants.ageBorder
          ? false
          : true);

  double _findLat(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.lat;

  double _findLon(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.lon;

  String _findVerificationCode(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.verificationCode;

  int _findMembershipTypeId(BuildContext context) => context
      .read<UserBloc>()
      .state
      .userList
      .last
      .membershipType
      .membershipTypeId!;

  /// Database Methods -------------------------------------------------------------------------------------------------
  void _updateUserIntoDB(BuildContext context, UserDB userDB) {
    context.read<UserDBBloc>().add(UpdateUserDBEvent(userDB: userDB));
  }

  void _bringUserFromDB(
    BuildContext context,
    UserBloc userBloc,
    UserDynamicBloc userDynamicBloc,
  ) {
    userBloc.add(LoadUserEvent(uId: _findUserId));
    userDynamicBloc.add(LoadUserDynamicEvent(uId: _findUserId));
    //
    //context.read<UserBloc>().add(LoadUserEvent(uId: _findUserId));
    // context.read<UserDynamicBloc>().add(LoadUserDynamicEvent(uId: _findUserId));
  }

  /// Submit method ----------------------------------------------------------------------------------------------------
  void _submitNameSurnameField(BuildContext context) {
    context.read<TextOfNameSurnameOnPersonalDetailEditingPopUpBloc>().add(
        (TextOfNameSurnameOnPersonalDetailEditingPopUpSubmit(
            _findUserNameSurname(context))));
    context.read<TextFieldOfNameSurnameOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfNameSurnameOnPersonalDetailEditingPopUpSubmit(
            _findUserNameSurname(context)));
  }

  void _submitUsernameField(BuildContext context) {
    context.read<TextOfUsernameOnPersonalDetailEditingPopUpBloc>().add(
        TextOfUsernameOnPersonalDetailEditingPopUpSubmit(
            _findUserUsername(context)));
    context.read<TextFieldOfUsernameOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfUsernameOnPersonalDetailEditingPopUpSubmit(
            _findUserUsername(context)));
  }

  void _submitBirthyearField(BuildContext context) {
    context.read<TextOfBirthyearOnPersonalDetailEditingPopUpBloc>().add(
        TextOfBirthyearOnPersonalDetailEditingPopUpSubmit(
            _findUserBirthyear(context)));
    context.read<TextFieldOfBirthyearOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfBirthyearOnPersonalDetailEditingPopUpSubmit(
            context.read<UserBloc>().state.userList.last.birthyear));
  }

  void _submitGenderDropbox(BuildContext context) {
    context.read<TextOfGenderOnPersonalDetailEditingPopUpBloc>().add(
        TextOfGenderOnPersonalDetailEditingPopUpSubmit(
            _findUserGender(context)));
    context.read<DropdownOfGenderOnPersonalDetailEditingPopUpBloc>().add(
        DropdownOfGenderOnPersonalDetailEditingPopUpSubmit(
            _findUserGender(context)));
  }

  void _submitEmailField(BuildContext context) {
    context.read<TextOfEmailOnPersonalDetailEditingPopUpBloc>().add(
        TextOfEmailOnPersonalDetailEditingPopUpSubmit(_findUserEmail(context)));
    context.read<TextFieldOfEmailOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfEmailOnPersonalDetailEditingPopUpSubmit(
            _findUserEmail(context)));
  }

  void _submitAddressField(BuildContext context) {
    context.read<TextOfAddressOnPersonalDetailEditingPopUpBloc>().add(
        TextOfAddressOnPersonalDetailEditingPopUpSubmit(
            _findUserAddress(context)));
    context.read<TextFieldOfAddressOnPersonalDetailEditingPopUpBloc>().add(
        TextFieldOfAddressOnPersonalDetailEditingPopUpSubmit(
            _findUserAddress(context)));
  }

  void _submitCityDropbox(BuildContext context) {
    context.read<TextOfCityOnPersonalDetailEditingPopUpBloc>().add(
        TextOfCityOnPersonalDetailEditingPopUpSubmit(_findCityDetail(context)));
    context.read<DropdownOfCityOnPersonalDetailEditingPopUpBloc>().add(
        DropdownOfCityOnPersonalDetailEditingPopUpSubmit(
            _findCityDetail(context)));
  }

  void _submitCountryDropbox(BuildContext context) {
    context.read<TextOfCountryOnPersonalDetailEditingPopUpBloc>().add(
        (TextOfCountryOnPersonalDetailEditingPopUpSubmit(
            _findCountryDetail(context))));
    context.read<DropdownOfCountryOnPersonalDetailEditingPopUpBloc>().add(
        DropdownOfCountryOnPersonalDetailEditingPopUpSubmit(
            _findCountryDetail(context)));
  }

  void _submitAboutYourselfField(BuildContext context) {
    context
        .read<TextOfAboutYourselfOnPersonalDetailEditingPopUpBloc>()
        .add((TextOfAboutYourselfOnPersonalDetailEditingPopUpClear()));
    context
        .read<TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpBloc>()
        .add(TextFieldOfAboutYourselfOnPersonalDetailEditingPopUpSubmit(
            _findUserAboutYourself(context)));
  }

  String _findCityDetail(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.countryCity.city.cityDetail;

  String _findCountryDetail(BuildContext context) => context
      .read<UserBloc>()
      .state
      .userList
      .last
      .countryCity
      .country
      .countryDetail;

  /// GENERAL METHODS ==================================================================================================
  /// Get Methods ------------------------------------------------------------------------------------------------------
  int _getCityId(BuildContext context) => context
      .read<CityDynamicByCountryBloc>()
      .state
      .cityDynamicList
      .where((element) => element.cityDetail == _chosenCityDetail(context))
      .first
      .cityId!;

  int _getCountryId(BuildContext context) => context
      .read<CountryDynamicBloc>()
      .state
      .countryDynamicList
      .where(
          (element) => element.countryDetail == _chosenCountryDetail(context))
      .first
      .countryId!;

  /// Chosen Methods ---------------------------------------------------------------------------------------------------
  String _findChosenGender(BuildContext context) => context
      .read<TextOfGenderOnPersonalDetailEditingPopUpBloc>()
      .state
      .gender!;

  String _findChosenBirthyear(BuildContext context) => context
      .read<TextOfBirthyearOnPersonalDetailEditingPopUpBloc>()
      .state
      .birthyear!;

  String _chosenCityDetail(BuildContext context) =>
      context.read<TextOfCityOnPersonalDetailEditingPopUpBloc>().state.city!;

  String _chosenCountryDetail(BuildContext context) => context
      .read<TextOfCountryOnPersonalDetailEditingPopUpBloc>()
      .state
      .country!;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  int get _findUserId => _appNumberConstants.appUserId;

  String _findUsername(BuildContext context) => context
      .read<TextOfUsernameOnPersonalDetailEditingPopUpBloc>()
      .state
      .username!;

  String _findUserUsername(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.username;

  String _findUserBirthyear(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.birthyear.toString();

  String _findUserGender(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.gender.genderDetail;

  String _findUserEmail(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.email;

  String _findUserAddress(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.address;

  String _findUserAboutYourself(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.aboutUser;

  /// SHOW DIALOGS =====================================================================================================
  /// This function is showing Dialog about missing selection. [alertLabel] is information about the subject of the
  /// alert. [_createShowDialogAboutSelection] funcition returns [SelectionAlertDialog] widget which is local
  /// widget. In case the widget needs somewhere in app, it will be moved to general widget file.
  Future<dynamic> _createShowDialogAboutSelection(
    BuildContext context,
    String alertLabel,
  ) =>
      showDialog(
          context: context,
          builder: (_) => SelectionAlertDialog(alertLabel: alertLabel));

  /// Database Methods -------------------------------------------------------------------------------------------------
  void _bringChosenCountryCityDetailFromDB(BuildContext context) {
    context
        .read<CountryCityDynamicByChosenAttributesBloc>()
        .add(LoadCountryCityDynamicByChosenAttributesEvent(
          cityId: _getCityId(context),
          countryId: _getCountryId(context),
        ));
  }

  /// Screen Method ----------------------------------------------------------------------------------------------------
  void _closeUpdatingPopUp(BuildContext context, int pageCount) {
    Navigator.of(context).popUntil((_) => pageCount++ >= 2);
  }

  void _closePopUp(BuildContext context) => Navigator.of(context).pop();
}
