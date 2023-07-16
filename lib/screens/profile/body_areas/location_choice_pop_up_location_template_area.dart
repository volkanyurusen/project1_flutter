import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/model_dbs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/widgets/widget.dart';

class LocationChoicePopUpLocationTemplateArea extends StatelessWidget {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppTimeConstants _appTimeConstants = AppTimeConstants();

  LocationChoicePopUpLocationTemplateArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _buildLocationTemplateArea();
  }

  // LOCATION TEMPLATE AREA ============================================================================================
  // BUILD ============================================================================================================
  BlocBuilder<LocationTemplateDynamicByUserBloc,
          LocationTemplateDynamicByUserState>
      _buildLocationTemplateArea() => BlocBuilder<
              LocationTemplateDynamicByUserBloc,
              LocationTemplateDynamicByUserState>(
            builder: (context, state) {
              switch (state.status) {
                case StatusWithoutLoading.initial:
                  return const StateLoading();
                case StatusWithoutLoading.success:
                  return _createLocationTemplateChosingColumn(context);
                case StatusWithoutLoading.failure:
                  return StateError(error: state.error);
              }
            },
          );

  // BUILD ============================================================================================================
  CustomColumn _createLocationTemplateChosingColumn(BuildContext context) =>
      CustomColumn(children: _generateLocationTemplates(context));

  // GENERATE ==========================================================================================================
  List<Widget> _generateLocationTemplates(BuildContext context) =>
      List.generate(
        _findNumberOfLocationTemplates(context),
        (index) => _createLocationChoiceButton(context, index),
      );

  // CREATE ==========================================================================================================
  LocationChoiceButton _createLocationChoiceButton(
          BuildContext context, int index) =>
      LocationChoiceButton(
        locationName: _findLocationName(context, index),
        onTap: () {
          _initiateAssignProcess(context, index);
          _recallResultOfPreferredActivityDynamicBloc(context, index);
          _createDBProcessLoaderDialog(context, index);
        },
      );

  // METHODS ===========================================================================================================
  void _initiateAssignProcess(BuildContext context, int index) {
    _assignLocationTemplateAsChosen(context, index);
    UserDB userDB = _createUserDBInstance(context, index);
    _updateUserIntoDB(context, userDB);
  }

  void _recallResultOfPreferredActivityDynamicBloc(
    BuildContext context,
    int index,
  ) {
    _cleanResultOfPrefferdActivityList(context);
    context
        .read<ResultOfPreferredActivityDynamicBloc>()
        .add(LoadResultOfPreferredActivityDynamic(
          uId: _findUserId,
          activityTitle: context
              .read<CreatedActivityDynamicByHostBloc>()
              .state
              .createdActivityDynamicList[0]
              .activityNameDynamic
              .activityTitle,
          locationCircularDiamter: context
              .read<LocationTemplateDynamicByUserBloc>()
              .state
              .locationTemplateDynamicList
              .elementAt(index)
              .locationDetailDynamic
              .membershipMaxDiameter,
          lat: _findLat(context, index),
          lon: _findLon(context, index),
        ));
  }

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findNumberOfLocationTemplates(BuildContext context) => context
      .read<LocationTemplateDynamicByUserBloc>()
      .state
      .locationTemplateDynamicList
      .length;

  String _findLocationName(
    BuildContext context,
    int index,
  ) =>
      context
          .read<LocationTemplateDynamicByUserBloc>()
          .state
          .locationTemplateDynamicList
          .elementAt(index)
          .locationTemplateName;

  // USER DETAIL DIALOG ================================================================================================
  // METHODS ===========================================================================================================
  Future<dynamic> _createDBProcessLoaderDialog(
          BuildContext context, int index) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return _listenUserDetailBroughtFromDB(index);
          });

  // LISTEN ============================================================================================================
  BlocConsumer<UserDBBloc, UserDBState> _listenUserDetailBroughtFromDB(
          int index) =>
      BlocConsumer<UserDBBloc, UserDBState>(
        listenWhen: (previous, current) =>
            _checkWhetherChosenLocationIsChanged(current),
        listener: (context, state) {
          _recallUserBloc(context);
        },
        builder: (context, state) {
          switch (state.status) {
            case Status.initial:
              return DBProcessLoader();
            case Status.loading:
              return DBProcessLoader();
            case Status.success:
              return _initiateSuccessfulEndingProcess(context);
            case Status.failure:
              return StateError(error: state.error);
          }
        },
      );

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherChosenLocationIsChanged(UserDBState current) =>
      current.status == Status.success;

  // END METHODS =======================================================================================================
  LoadSuccessfullyAlertDialog _initiateSuccessfulEndingProcess(
      BuildContext context) {
    _closeTheScreenWithDelaying(context);
    return _displayLoadSuccessfullyDialog();
  }

  // METHODS ===========================================================================================================
  void _closeTheScreenWithDelaying(BuildContext context) {
    Future.delayed(_appTimeConstants.timeOutDuration, () {
      _closePopUp(context);
    });
  }

  // ALERT DIALOG ======================================================================================================
  // DISPLAY ===========================================================================================================
  LoadSuccessfullyAlertDialog _displayLoadSuccessfullyDialog() =>
      const LoadSuccessfullyAlertDialog(
          content:
              'The process which you chose has been completed without any mistake');

  // METHODS ===========================================================================================================
  // Find Methods ------------------------------------------------------------------------------------------------------
  int get _findUserId => _appNumberConstants.appUserId;

  String _findUsername(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.username;

  String _findNameSurname(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.nameSurname;

  String _findEmail(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.email;

  String _findAddress(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.address;

  int _findBirthyear(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.birthyear;

  int _findGender(BuildContext context) => context
      .read<GenderDynamicBloc>()
      .state
      .genderDynamicList
      .where((element) => element.genderDetail == _findChosenGender(context))
      .first
      .genderId!;

  int _findCountryCityId(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.countryCity.countryCityId!;

  String _findPicUrl(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.picUrl;

  String _findAboutUser(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.aboutUser;

  bool _findIsUnderAge(BuildContext context) =>
      (DateTime.now().year - int.parse(_findChosenBirthyear(context)) >=
              _appNumberConstants.ageBorder
          ? false
          : true);


  LocationDetailDynamic _findChosenLocationTemplate(
    BuildContext context,
    int index,
  ) =>
      context
          .read<LocationTemplateDynamicByUserBloc>()
          .state
          .locationTemplateDynamicList
          .elementAt(index)
          .locationDetailDynamic;

  double _findLat(BuildContext context, int index) =>
      _findChosenLocationTemplate(context, index).lat;

  double _findLon(BuildContext context, int index) =>
      _findChosenLocationTemplate(context, index).lon;

  String _findVerificationCode(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.verificationCode;

  int _findMembershipTypeId(BuildContext context) => context
      .read<UserBloc>()
      .state
      .userList
      .last
      .membershipType
      .membershipTypeId!;

  /// Chosen Methods ---------------------------------------------------------------------------------------------------
  String _findChosenGender(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.gender.genderDetail;

  String _findChosenBirthyear(BuildContext context) =>
      context.read<UserBloc>().state.userList.last.birthyear.toString();

  // Assign Methods ----------------------------------------------------------------------------------------------------
  void _assignLocationTemplateAsChosen(BuildContext context, int index) {
    context
        .read<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
        .pressedChosenLocationDetailDynamicButtonOnCreateActivityScreen(
            _findChosenLocationTemplate(context, index));
  }

  /// Database Methods -------------------------------------------------------------------------------------------------
  void _updateUserIntoDB(BuildContext context, UserDB userDB) {
    context.read<UserDBBloc>().add(UpdateUserDBEvent(userDB: userDB));
  }

  void _recallUserBloc(BuildContext context) {
    context.read<UserBloc>().add(RecallUserEvent());
    context
        .read<UserBloc>()
        .add(LoadUserEvent(uId: _appNumberConstants.appUserId));
  }

  void _cleanResultOfPrefferdActivityList(BuildContext context) {
    context
        .read<ResultOfPreferredActivityDynamicBloc>()
        .add(CleanResultOfPreferredActivityDynamic());
  }

  /// Create Model Instance --------------------------------------------------------------------------------------------
  UserDB _createUserDBInstance(BuildContext context, int index) {
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
      lat: _findLat(context, index),
      lon: _findLon(context, index),
      verificationCode: _findVerificationCode(context),
      membershipTypeId: _findMembershipTypeId(context),
      updatedAt: DateTime.now(),
      isActive: true,
    );
    return userDB;
  }

  // Screen Methods ----------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext context) {
    int pageCount = 0;
    Navigator.of(context).popUntil((_) => pageCount++ >= 2);
  }
}
