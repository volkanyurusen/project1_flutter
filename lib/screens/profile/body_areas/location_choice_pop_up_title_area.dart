import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/profile/pop_ups/zpop_ups.dart';
import 'package:my_project/widgets/widget.dart';

class LocationChoicePopUpTitleArea extends StatelessWidget {
  final AppInformationConstants _appInformationConstants =
      AppInformationConstants();
  final LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc;

  LocationChoicePopUpTitleArea(
      {required this.locationTemplateDynamicByUserBloc, super.key});

  @override
  Widget build(BuildContext context) {
    return _createLocationTitleArea(context, locationTemplateDynamicByUserBloc);
  }

  // LOCATION TITLE AREA ===============================================================================================
  // CREATE ============================================================================================================
  CustomTitle _createLocationTitleArea(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
  ) =>
      CustomTitle(
        spaceFromUpperWidget: 18,
        textLabel: 'Locations',
        tileWidget:
            _createIconButtonArea(context, locationTemplateDynamicByUserBloc),
      );

  // ICON BUTTON AREA ==================================================================================================
  // CREATE ============================================================================================================
  IconButton _createIconButtonArea(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
  ) =>
      IconButton(
        icon: _displayAddingIcon(),
        onPressed: () {
          _displayLocationTemplateAddingDialogOrMembershipUpdatingDialog(
              context, locationTemplateDynamicByUserBloc);
        },
      );

  // DISPLAY ===========================================================================================================
  Icon _displayAddingIcon() => const Icon(Icons.add);

  Future<dynamic>
      _displayLocationTemplateAddingDialogOrMembershipUpdatingDialog(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
  ) =>
          showDialog(
              context: context,
              builder: (context) {
                return _checkWhetherMembershipLimitOfCreatingActivityIsExceeded(
                        context)
                    ? MembershipUpdating(
                        informationContent: _appInformationConstants
                            .kAboutLocationTemplateLimit)
                    : LocationDetailLocationTemplateAddingPopUp(
                        locationTemplateDynamicByUserBloc:
                            locationTemplateDynamicByUserBloc);
              });

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherMembershipLimitOfCreatingActivityIsExceeded(
          BuildContext context) =>
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
