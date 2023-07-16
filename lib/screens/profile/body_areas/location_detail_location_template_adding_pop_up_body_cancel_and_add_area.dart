import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/blocs/text_of_latitude_longitude_on_location_detail_location_template_adding_pop_up/text_of_latitude_longitude_on_location_detail_location_template_adding_pop_up_bloc.dart';
import 'package:my_project/logic/blocs/text_of_location_template_name_on_location_detail_location_template_adding_pop_up/text_of_location_template_name_on_location_detail_location_template_adding_pop_up_bloc.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/widgets/widget.dart';

class LocationDetailLocationTemplateAddingPopUpBodyCancelAndAddArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppFeedbacks _appFeedbacks = AppFeedbacks();
  final AppTimeConstants _appTimeConstants = AppTimeConstants();

  final LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc;
  final TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc
      textFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc;
  final TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc
      textfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc;
  final double screenWidth;

  LocationDetailLocationTemplateAddingPopUpBodyCancelAndAddArea({
    required this.locationTemplateDynamicByUserBloc,
    required this.textFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc,
    required this.textfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? headlineSmall = context.textTheme.headlineSmall!;
    Color backgroundColor = Theme.of(context).colorScheme.background;

    return _createBottomButtonsArea(context, headlineSmall, backgroundColor);
  }

  // CREATE ============================================================================================================
  CustomColumn _createBottomButtonsArea(
    BuildContext context,
    TextStyle headlineSmall,
    Color backgroundColor,
  ) =>
      CustomColumn(
        children: [
          _createBottomRowForButtons(context, locationTemplateDynamicByUserBloc,
              headlineSmall, backgroundColor),
          const CustomAppSizedBox(),
        ],
      );

  CustomRow _createBottomRowForButtons(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
    TextStyle headlineSmall,
    Color backgroundColor,
  ) =>
      CustomRow(
        mainAxisSize: MainAxisSize.max,
        children: [
          _displayCancelButton(context, headlineSmall, backgroundColor),
          _displayAddButton(context, locationTemplateDynamicByUserBloc,
              headlineSmall, backgroundColor),
        ],
      );

  // CANCEL BUTTON =====================================================================================================
  // DISPLAY ===========================================================================================================
  CustomElevatedButton _displayCancelButton(
    BuildContext context,
    TextStyle headlineSmall,
    Color backgroundColor,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.cancel,
          textStyle: headlineSmall.copyWith(color: backgroundColor),
          elevatedButtonWidth: screenWidth * 0.90 * 0.34,
          buttonColor: _appColors.buttonDarkColor,
          onPressed: () {
            _clickCancelButton(context);
          });

  // METHODS ==========================================================================================================
  void _clickCancelButton(BuildContext context) {
    if (_checkTemplateNameFilledUp(context)) {
      _cleanTemplateName(context,
          textFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc);
    }
    if (_checkLatitudeLongitudeFilledUp(context)) {
      _cleanLatitudeLongitude(context,
          textfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc);
    }
    _closePopUp(context);
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkTemplateNameFilledUp(
    BuildContext context,
  ) =>
      context
          .read<
              TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc>()
          .state
          .templateName !=
      '';

  bool _checkLatitudeLongitudeFilledUp(BuildContext context) =>
      context
          .read<
              TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc>()
          .state
          .templateName !=
      '';

  // Clean Methods -----------------------------------------------------------------------------------------------------
  void _cleanTemplateName(
      BuildContext context,
      TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc
          textFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc) {
    context
        .read<
            TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc>()
        .add(
            (TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpClear()));
    textFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc
        .add(
            TextFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpClear());
  }

  void _cleanLatitudeLongitude(
      BuildContext context,
      TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc
          textfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc) {
    context
        .read<
            TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc>()
        .add(
            (TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpClear()));
    textfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc.add(
        TextfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpClear());
  }

  // ADD BUTTON ========================================================================================================
  // DISPLAY ===========================================================================================================
  CustomElevatedButton _displayAddButton(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
    TextStyle headlineSmall,
    Color backgroundColor,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.add,
          textStyle: headlineSmall.copyWith(color: backgroundColor),
          elevatedButtonWidth: screenWidth * 0.90 * 0.34,
          buttonColor: _appColors.secondary,
          onPressed: () {
            _clickAddButton(context, locationTemplateDynamicByUserBloc);
          });

  // METHODS ==========================================================================================================
  void _clickAddButton(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
  ) {
    if (_checkTemplateNameNotFilledUp(context)) {
      _displayDialogAboutDeficientTemplateName(context);
    } else if (_checkLatitudeLongitude(context)) {
      _displayDialogAboutDeficientLatitudeLongitude(context);
    } else {
      if (_checkWhetherChosenLocationExistsInTemplate(context)) {
        _displayExistenceAlertDialog(context);
      } else {
        _initiateAddingProcess(context, locationTemplateDynamicByUserBloc);
      }
    }
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkTemplateNameNotFilledUp(BuildContext context) =>
      context
          .read<
              TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc>()
          .state
          .templateName ==
      '';

  bool _checkLatitudeLongitude(BuildContext context) =>
      context
          .read<
              TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc>()
          .state
          .templateName ==
      '';

  bool _checkWhetherChosenLocationExistsInTemplate(BuildContext context) =>
      context
          .read<LocationTemplateDynamicByUserBloc>()
          .state
          .locationTemplateDynamicList
          .where((element) =>
              element.locationDetailDynamic.lat == _getLat(context))
          .where((element) =>
              element.locationDetailDynamic.lon == _getlon(context))
          .toList()
          .isNotEmpty;

  // Dialog Methods ----------------------------------------------------------------------------------------------------
  Future<dynamic> _displayDialogAboutDeficientTemplateName(
          BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutEmptyTemplateName);

  Future<dynamic> _displayDialogAboutDeficientLatitudeLongitude(
          BuildContext context) =>
      _createShowDialogAboutSelection(
          context, _appFeedbacks.feedbackAboutEmptyLatitudeLongitude);

  // DISPLAY ===========================================================================================================
  void _displayExistenceAlertDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) =>
            const InformationOfExistenceAlertDialog(detail: 'activity'));
  }

  // UPDATING METHODS ==================================================================================================
  // void _initiateAddingProcess(BuildContext context,
  //     LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc) {
  //   _addChosenLocationDetailIntoDatabase(context);
  //   _startTemplateAddingProcess(context, locationTemplateDynamicByUserBloc);
  // }

  // ADDING METHODS ====================================================================================================
  dynamic _initiateAddingProcess(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
  ) async {
    _bringChosenLocationDetailFromDB(context);
    _displayTemplateAddingDialog(context, locationTemplateDynamicByUserBloc);
  }

  // DISPLAY ===========================================================================================================
  void _displayTemplateAddingDialog(BuildContext context,
      LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc) {
    showDialog(
        context: context,
        builder: (context) {
          return _listenLocationDetailBroughtFromDB(
              locationTemplateDynamicByUserBloc);
        });
  }

  // LISTEN ============================================================================================================
  BlocListener<LocationDetailDynamicByChosenAttributesBloc,
          LocationDetailDynamicByChosenAttributesState>
      _listenLocationDetailBroughtFromDB(
          LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc) {
    return BlocListener<LocationDetailDynamicByChosenAttributesBloc,
        LocationDetailDynamicByChosenAttributesState>(
      listenWhen: (previous, current) =>
          _checkWhetherDetailsBroughtSuccessfully(current),
      listener: (context, state) {
        if (state.locationDetailDynamicList.isEmpty) {
          _addLocationDetailIntoDBFirstThenBringItFromDB(context);
        } else {
          _addTemplateIntoDBCleanAllFieldAndCloseAddingPopUp(
              context, locationTemplateDynamicByUserBloc);
        }
      },
      child: _buildChosenLocationDetailBroughtFromDB(),
    );
  }

  // METHOD ============================================================================================================
  void _addLocationDetailIntoDBFirstThenBringItFromDB(BuildContext context) {
    _addChosenLocationDetailIntoDB(context);
    _bringChosenLocationDetailFromDB(context);
  }

  void _addTemplateIntoDBCleanAllFieldAndCloseAddingPopUp(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
  ) {
    LocationTemplate locationTemplate =
        _createLocationTemplateInstance(context);
    _addNewLocationTemplateIntoDB(context, locationTemplate);
    _changeLocationTemplateDynamicByUserState(
        locationTemplateDynamicByUserBloc);
    _bringLocationTemplateDynamicByUserFromDB(
        locationTemplateDynamicByUserBloc);
    _cleanAllButton(context);
  }

  // Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkWhetherDetailsBroughtSuccessfully(
          LocationDetailDynamicByChosenAttributesState current) =>
      current.status == Status.success;

  // Clear method -----------------------------------------------------------------------------------------------------
  void _cleanAllButton(BuildContext context) {
    _cleanTemplateName(context,
        textFieldOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc);
    _cleanLatitudeLongitude(context,
        textfieldOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc);
  }

  // BUILD =============================================================================================================
  BlocBuilder<LocationDetailDynamicByChosenAttributesBloc,
          LocationDetailDynamicByChosenAttributesState>
      _buildChosenLocationDetailBroughtFromDB() {
    return BlocBuilder<LocationDetailDynamicByChosenAttributesBloc,
        LocationDetailDynamicByChosenAttributesState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
            return DBProcessLoader();
          case Status.loading:
            return DBProcessLoader();
          case Status.success:
            Future.delayed(_appTimeConstants.timeOutDuration, () {
              _closeAddingPopUp(context);
            });
            return const LoadSuccessfullyAlertDialog();
          case Status.failure:
            return StateError(error: state.error);
        }
      },
    );
  }

  // Get Methods ------------------------------------------------------------------------------------------------------
  double _findPrefferedLocationCircularDiameter(BuildContext context) => context
      .read<UserDynamicBloc>()
      .state
      .userDynamicList
      .last
      .membershipTypeDynamic
      .locationCircularDiameter;

  double _findMembershipMaxDiameter(BuildContext context) => context
      .read<UserDynamicBloc>()
      .state
      .userDynamicList
      .last
      .membershipTypeDynamic
      .locationCircularDiameter;

  double _getLat(BuildContext context) => AppFunctions().roundDouble(
      double.parse(context
          .read<
              TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc>()
          .state
          .templateName!
          .split(',')[0]
          .trim()),
      3);

  double _getlon(BuildContext context) => AppFunctions().roundDouble(
      double.parse(context
          .read<
              TextOfLatitudeLongitudeOnLocationDetailLocationTemplateAddingPopUpBloc>()
          .state
          .templateName!
          .split(',')[1]
          .trim()),
      3);

  // Find Mehtods -----------------------------------------------------------------------------------------------------
  int _findLocationDetailId(BuildContext context) => context
      .read<LocationDetailDynamicByChosenAttributesBloc>()
      .state
      .locationDetailDynamicList
      .last
      .locationDetailId!;

  String _findTemplateName(BuildContext context) => context
      .read<
          TextOfLocationTemplateNameOnLocationDetailLocationTemplateAddingPopUpBloc>()
      .state
      .templateName!;

  // SHOW DIALOGS =====================================================================================================
  // This function is showing Dialog about missing selection. [alertLabel] is information about the subject of the
  // alert. [_createShowDialogAboutSelection] funcition returns [SelectionAlertDialog] widget which is local
  // widget. In case the widget needs somewhere in app, it will be moved to general widget file.
  Future<dynamic> _createShowDialogAboutSelection(
    BuildContext context,
    String alertLabel,
  ) =>
      showDialog(
          context: context,
          builder: (_) => SelectionAlertDialog(alertLabel: alertLabel));

  // State Changing Methods -------------------------------------------------------------------------------------------
  void _changeLocationTemplateDynamicByUserState(
      LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc) {
    locationTemplateDynamicByUserBloc
        .add(RecallLocationTemplateDynamicByUserEvent());
  }

  // Database Methods -------------------------------------------------------------------------------------------------
  void _addChosenLocationDetailIntoDB(BuildContext context) {
    context.read<LocationDetailBloc>().add(AddLocationDetailEvent(
        locationDetail: _createLocationDetailInstance(context)));
  }

  void _bringChosenLocationDetailFromDB(BuildContext context) {
    context
        .read<LocationDetailDynamicByChosenAttributesBloc>()
        .add(LoadLocationDetailDynamicByChosenAttributesEvent(
          prefferedLocationCircularDiameter:
              _findPrefferedLocationCircularDiameter(context),
          membershipMaxDiameter: _findMembershipMaxDiameter(context),
          lat: _getLat(context),
          lon: _getlon(context),
        ));
  }

  void _addNewLocationTemplateIntoDB(
      BuildContext context, LocationTemplate locationTemplate) {
    context
        .read<LocationTemplateBloc>()
        .add(AddLocationTemplateEvent(locationTemplate: locationTemplate));
  }

  void _bringLocationTemplateDynamicByUserFromDB(
      LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc) {
    locationTemplateDynamicByUserBloc.add(
        LoadLocationTemplateDynamicByUserEvent(
            uId: _appNumberConstants.appUserId));
  }

  // Create Model Instance --------------------------------------------------------------------------------------------
  LocationDetail _createLocationDetailInstance(BuildContext context) =>
      LocationDetail(
          prefferedLocationCircularDiameter:
              _findPrefferedLocationCircularDiameter(context),
          membershipMaxDiameter: _findMembershipMaxDiameter(context),
          lat: _getLat(context),
          lon: _getlon(context));

  LocationTemplate _createLocationTemplateInstance(BuildContext context) {
    final LocationTemplate locationTemplate = LocationTemplate(
      userId: _appNumberConstants.appUserId,
      locationDetailId: _findLocationDetailId(context),
      locationTemplateName: _findTemplateName(context),
    );
    return locationTemplate;
  }

  // Screen Method ----------------------------------------------------------------------------------------------------
  void _closePopUp(BuildContext context) => Navigator.of(context).pop();

  void _closeAddingPopUp(BuildContext context) {
    int pageCount = 0;
    Navigator.of(context).popUntil((_) => pageCount++ >= 2);
  }
}
