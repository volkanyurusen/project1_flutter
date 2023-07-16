import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/existence/local_widgets/local_widgets.dart';
import 'package:my_project/screens/existence/pop_ups/zpop_ups.dart';
import 'package:my_project/widgets/widget.dart';

class TemplateBodyLocationTemplateTitleArea extends StatelessWidget {
  final AppInformationConstants _appInformationConstants =
      AppInformationConstants();

  TemplateBodyLocationTemplateTitleArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc =
        context.read<LocationTemplateDynamicByUserBloc>();

    return _createLocationTemplateAddingArea(
        context, locationTemplateDynamicByUserBloc);
  }

  // CREATE ============================================================================================================
  AppHeader _createLocationTemplateAddingArea(BuildContext context,
      LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc) {
    return AppHeader(
      firstWidget: _displayLocationTemplateTitle(),
      thirdWidget: __displayLocationTemplateAddingButton(
          context, locationTemplateDynamicByUserBloc),
    );
  }

  // LOCATION TEMPLATE TITLE ===========================================================================================
  // DISPLAY ===========================================================================================================
  AppHeaderText _displayLocationTemplateTitle() =>
      const AppHeaderText(textLabel: 'Location Templates');

  // LOCATION TEMPLATE ADDING BUTTON ===================================================================================
  // DISPLAY ===========================================================================================================
  AddNewTemplateIconButton __displayLocationTemplateAddingButton(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
  ) =>
      AddNewTemplateIconButton(
        onPressed: () {
          _checkWhetherMembershipLimitOfCreatingActivityIsExceeded(context)
              ? _createMembershipUpdatingDialog(context)
              : _createLocationTemplateAddingDialog(
                  context, locationTemplateDynamicByUserBloc);
        },
      );

  // MEMBERSHIP UPDATING DIALOG ========================================================================================
  // CREATE ============================================================================================================
  Future<dynamic> _createMembershipUpdatingDialog(BuildContext context) =>
      showDialog(
          context: context,
          builder: (context) {
            return _displayMembershipUpdatingPopUp();
          });

  // DISPLAY ===========================================================================================================
  MembershipUpdating _displayMembershipUpdatingPopUp() => MembershipUpdating(
      informationContent: _appInformationConstants.kAboutLocationTemplateLimit);

  // LOCATION TEMPLATE ADDING DIALOG ===================================================================================
  // CREATE ============================================================================================================
  Future<dynamic> _createLocationTemplateAddingDialog(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
  ) =>
      showDialog(
          context: context,
          builder: (context) {
            return _displayLocationTemplateAddingPopUp(
                locationTemplateDynamicByUserBloc);
          });

  // DISPLAY ===========================================================================================================
  LocationTemplateAddingPopUp _displayLocationTemplateAddingPopUp(
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
  ) =>
      LocationTemplateAddingPopUp(
          locationTemplateDynamicByUserBloc: locationTemplateDynamicByUserBloc);

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherMembershipLimitOfCreatingActivityIsExceeded(
    BuildContext context,
  ) =>
      _findNumberOfExistingCreatedActivities(context) >=
      _findLimitOfCreationPerDay(context);

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findNumberOfExistingCreatedActivities(BuildContext context) => context
      .read<LocationTemplateDynamicByUserBloc>()
      .state
      .locationTemplateDynamicList
      .length;

  int _findLimitOfCreationPerDay(BuildContext context) => context
      .read<UserDynamicBloc>()
      .state
      .userDynamicList
      .last
      .membershipTypeDynamic
      .templateLimit;
}
