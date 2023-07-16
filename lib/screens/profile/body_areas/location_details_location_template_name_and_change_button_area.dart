import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/location_template_dynamic.dart';
import 'package:my_project/screens/profile/pop_ups/zpop_ups.dart';
import 'package:my_project/widgets/widget.dart';

class LocationDetailsLocationTemplateNamelAndChangeButtonArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  LocationDetailsLocationTemplateNamelAndChangeButtonArea({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? locationNameTextStyle =
        context.textTheme.displaySmall!.copyWith(color: _appColors.secondary);
    TextStyle? locationNameLightTextStyle = context.textTheme.displaySmall!
        .copyWith(color: _appColors.textColor.withOpacity(0.5));

    return Column(
      children: [
        const CustomAppSizedBox(),
        _buildUserTypeNameAndChangeButton(
            locationNameTextStyle, locationNameLightTextStyle),
        const CustomAppSizedBox(),
      ],
    );
  }

  // BUILD =============================================================================================================
  BlocBuilder<LocationTemplateDynamicByUserBloc,
      LocationTemplateDynamicByUserState> _buildUserTypeNameAndChangeButton(
    TextStyle locationNameTextStyle,
    TextStyle locationNameLightTextStyle,
  ) =>
      BlocBuilder<LocationTemplateDynamicByUserBloc,
              LocationTemplateDynamicByUserState>(
          builder: (context, locationState) {
        switch (locationState.status) {
          case StatusWithoutLoading.initial:
            return SkeltonContainer(height: 24, width: 200);
          case StatusWithoutLoading.success:
            return _createLocationNameAndChangeButton(context, locationState,
                locationNameTextStyle, locationNameLightTextStyle);
          case StatusWithoutLoading.failure:
            return StateError(error: locationState.error);
        }
      });

  // LOCATION NAME & CHANGE BUTTON =====================================================================================
  // CREATE ============================================================================================================
  AppHeader _createLocationNameAndChangeButton(
    BuildContext context,
    LocationTemplateDynamicByUserState locationState,
    TextStyle locationNameTextStyle,
    TextStyle locationNameLightTextStyle,
  ) =>
      AppHeader(
        firstWidget: _buildChosenLocationTemplateName(
            locationState, locationNameTextStyle, locationNameLightTextStyle),
        thirdWidget: _createChangeButton(context),
      );

  // LOCATION NAME =====================================================================================================
  // BUILD ============================================================================================================
  BlocBuilder<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit,
          ChosenLocationDetailDynamicButtonOnCreateActivityScreenState>
      _buildChosenLocationTemplateName(
              LocationTemplateDynamicByUserState locationState,
              TextStyle locationNameTextStyle,
              TextStyle locationNameLightTextStyle) =>
          BlocBuilder<
              ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit,
              ChosenLocationDetailDynamicButtonOnCreateActivityScreenState>(
            builder: (context, state) {
              return _displayLocationName(context, locationState, state,
                  locationNameTextStyle, locationNameLightTextStyle);
            },
          );

  // DISPLAY ===========================================================================================================
  Widget _displayLocationName(
    BuildContext context,
    LocationTemplateDynamicByUserState locationState,
    ChosenLocationDetailDynamicButtonOnCreateActivityScreenState state,
    TextStyle locationNameTextStyle,
    TextStyle locationNameLightTextStyle,
  ) =>
      _chceckWhetherChosenLocationTemplateHasNotBeenAssignedYet(context, state)
          ? _displayDefaultLocationName(
              locationNameTextStyle, locationNameLightTextStyle)
          : _buildCurrentlocationTemplateName(
              locationState, locationNameTextStyle);

  AppHeaderText _displayDefaultLocationName(
    TextStyle locationNameTextStyle,
    TextStyle locationNameLightTextStyle,
  ) =>
      AppHeaderText(
          textLabel: 'Location Name', textStyle: locationNameLightTextStyle);

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _chceckWhetherChosenLocationTemplateHasNotBeenAssignedYet(
    BuildContext context,
    ChosenLocationDetailDynamicButtonOnCreateActivityScreenState state,
  ) =>
      state.chosenLocationDetailDynamicList.isEmpty;

  // BUILD ===========================================================================================================
  BlocBuilder<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit,
          ChosenLocationDetailDynamicButtonOnCreateActivityScreenState>
      _buildCurrentlocationTemplateName(
    LocationTemplateDynamicByUserState locationState,
    TextStyle locationNameTextStyle,
  ) =>
          BlocBuilder<
              ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit,
              ChosenLocationDetailDynamicButtonOnCreateActivityScreenState>(
            builder: (context, state) {
              return _displayCurrentlocationTemplateName(
                  context, locationState, locationNameTextStyle);
            },
          );

  // DISPLAY ===========================================================================================================
  AppHeaderText _displayCurrentlocationTemplateName(
    BuildContext context,
    LocationTemplateDynamicByUserState locationState,
    TextStyle locationNameTextStyle,
  ) =>
      AppHeaderText(
          textLabel: _getCurrentLocationTemplateName(context, locationState),
          textStyle: locationNameTextStyle);

  // METHOD ===========================================================================================================
  // Get Methods -------------------------------------------------------------------------------------------------------
  String _getCurrentLocationTemplateName(
    BuildContext context,
    LocationTemplateDynamicByUserState locationState,
  ) =>
      _appFunctions.showString(_getLocationTemplateName(context, locationState),
          lenght: 14);

  String _getLocationTemplateName(
    BuildContext context,
    LocationTemplateDynamicByUserState locationState,
  ) {
    if (_chceckWhetherChosenLocationTemplateIsAssigned(context)) {
      return _getChosenLocationTemplate(locationState, context)
          .first
          .locationTemplateName;
    }
    return 'Location Name';
  }

  Iterable<LocationTemplateDynamic> _getChosenLocationTemplate(
          LocationTemplateDynamicByUserState locationState,
          BuildContext context) =>
      locationState.locationTemplateDynamicList.where((element) =>
          element.locationDetailDynamic.locationDetailId ==
          _findChosenLocationDetailId(context));

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _chceckWhetherChosenLocationTemplateIsAssigned(BuildContext context) =>
      context
          .read<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
          .state
          .chosenLocationDetailDynamicList
          .isNotEmpty;

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findChosenLocationDetailId(BuildContext context) => context
      .read<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
      .state
      .chosenLocationDetailDynamicList
      .last
      .locationDetailId!;

  // LOCATION CHANGE BUTTON ============================================================================================
  ChoiceContainer _createChangeButton(
    BuildContext context,
  ) =>
      ChoiceContainer(
        containerText: 'Change',
        buttonColor: _appColors.secondary,
        buttonBorderColor: _appColors.secondary,
        onTap: () {
          _bringUserDetailsFromDB(context);
          _displayLocationDialog(context);
        },
      );

  // ACTIVITY LOCATION =================================================================================================
  // DISLAY ===========================================================================================================
  Future<dynamic> _displayLocationDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return LocationChoicePopUp();
      });

  // METHODS ===========================================================================================================
  // Database Methods --------------------------------------------------------------------------------------------------
  void _bringUserDetailsFromDB(BuildContext context) {
    context
        .read<UserBloc>()
        .add(LoadUserEvent(uId: _appNumberConstants.appUserId));
    context
        .read<UserDynamicBloc>()
        .add(LoadUserDynamicEvent(uId: _appNumberConstants.appUserId));
  }
}
