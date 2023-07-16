import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

import '../local_widgets/local_widgets.dart';
import '../pop_ups/zpop_ups.dart';

class TemplateBodyActivityTemplateTitleArea extends StatelessWidget {
  final AppInformationConstants _appInformationConstants =
      AppInformationConstants();

  TemplateBodyActivityTemplateTitleArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc =
        context.read<ActivityTemplateDynamicByUserBloc>();

    return _createActivityTemplateAddingArea(
        context, activityTemplateDynamicByUserBloc);
  }

  // CREATE ============================================================================================================
  AppHeader _createActivityTemplateAddingArea(
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
  ) =>
      AppHeader(
        firstWidget: _displayActivityTemplateTitle(),
        thirdWidget: __displayActivityTemplateAddingButton(
            context, activityTemplateDynamicByUserBloc),
      );

  // ACTIVITY TEMPLATE TITLE ===========================================================================================
  // DISPLAY ===========================================================================================================
  AppHeaderText _displayActivityTemplateTitle() =>
      const AppHeaderText(textLabel: 'Activity Templates');

  // ACTIVITY TEMPLATE ADDING BUTTON ===================================================================================
  // DISPLAY ===========================================================================================================
  AddNewTemplateIconButton __displayActivityTemplateAddingButton(
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
  ) =>
      AddNewTemplateIconButton(onPressed: () {
        _checkWhetherMembershipLimitOfAddingActivityTemplateIsExceeded(context)
            ? _createMembershipUpdatingDialog(context)
            : _createActivityTemplateAddingDialog(
                context, activityTemplateDynamicByUserBloc);
      });

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
      informationContent: _appInformationConstants.kAboutActivityTemplateLimit);

  // ACTIVITY TEMPLATE ADDING DIALOG ===================================================================================
  // CREATE ============================================================================================================
  Future<dynamic> _createActivityTemplateAddingDialog(
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
  ) =>
      showDialog(
          context: context,
          builder: (context) {
            return _displayActivityTemplateAddingPopUp(
                activityTemplateDynamicByUserBloc);
          });

  // DISPLAY ===========================================================================================================
  ActivityTemplateAddingPopUp _displayActivityTemplateAddingPopUp(
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
  ) =>
      ActivityTemplateAddingPopUp(
          activityTemplateDynamicByUserBloc: activityTemplateDynamicByUserBloc);

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherMembershipLimitOfAddingActivityTemplateIsExceeded(
    BuildContext context,
  ) =>
      _findNumberOfExistingActivityTemplates(context) >=
      _findLimitOfActivityTemplates(context);

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findNumberOfExistingActivityTemplates(BuildContext context) => context
      .read<ActivityTemplateDynamicByUserBloc>()
      .state
      .activityTemplateDynamicList
      .length;

  int _findLimitOfActivityTemplates(BuildContext context) => context
      .read<UserDynamicBloc>()
      .state
      .userDynamicList
      .last
      .membershipTypeDynamic
      .templateLimit;
}
