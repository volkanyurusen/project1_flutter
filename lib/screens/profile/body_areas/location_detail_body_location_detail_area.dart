import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class LocationDetailBodyLocationDetailArea extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();
  final AppColors _appColors = AppColors();

  LocationDetailBodyLocationDetailArea({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle templateNameTextStyle = context.textTheme.headlineMedium!
        .copyWith(color: _appColors.textColor.withOpacity(0.75));
    TextStyle chosenTemplateNameTextStyle = context.textTheme.headlineMedium!
        .copyWith(color: _appColors.secondary.withOpacity(0.75));

    return Column(
      children: [
        _createUserTypeDetailsColumn(
            templateNameTextStyle, chosenTemplateNameTextStyle),
        const CustomAppSizedBox(),
      ],
    );
  }

  // USER TYPE DETAIL COLUMN ===========================================================================================
  // CREATE ============================================================================================================
  CustomColumn _createUserTypeDetailsColumn(
    TextStyle templateNameTextStyle,
    TextStyle chosenTemplateNameTextStyle,
  ) =>
      CustomColumn(
        children: [
          _buildUserTypeDetails(
              templateNameTextStyle, chosenTemplateNameTextStyle),
        ],
      );

  // USER TYPE DETAIL COLUMN ===========================================================================================
  // BUILD =============================================================================================================
  BlocBuilder<LocationTemplateDynamicByUserBloc,
      LocationTemplateDynamicByUserState> _buildUserTypeDetails(
    TextStyle templateNameTextStyle,
    TextStyle chosenTemplateNameTextStyle,
  ) =>
      BlocBuilder<LocationTemplateDynamicByUserBloc,
              LocationTemplateDynamicByUserState>(
          builder: (context, locationState) {
        switch (locationState.status) {
          case StatusWithoutLoading.initial:
            return const TypeDetailSkelton();
          case StatusWithoutLoading.success:
            return CustomColumn(
              children: _generateListOfDetail(context, locationState,
                  templateNameTextStyle, chosenTemplateNameTextStyle),
            );
          case StatusWithoutLoading.failure:
            return StateError(error: locationState.error);
        }
      });

  // LIST OF DETAIL ====================================================================================================
  // GENERATE ==========================================================================================================
  List<Widget> _generateListOfDetail(
    BuildContext context,
    LocationTemplateDynamicByUserState locationState,
    TextStyle templateNameTextStyle,
    TextStyle chosenTemplateNameTextStyle,
  ) =>
      List.generate(
        locationState.locationTemplateDynamicList.length,
        (index) => _createDetailLine(context, locationState, index,
            templateNameTextStyle, chosenTemplateNameTextStyle),
      );

  // DETAIL LINE =======================================================================================================
  // CREATE ============================================================================================================
  AppHeader _createDetailLine(
    BuildContext context,
    LocationTemplateDynamicByUserState locationState,
    int index,
    TextStyle templateNameTextStyle,
    TextStyle chosenTemplateNameTextStyle,
  ) =>
      AppHeader(
        spaceFromUpperWidget: index == 0 ? 18 : 36,
        firstWidget: _buildDetailTitle(context, locationState, index,
            templateNameTextStyle, chosenTemplateNameTextStyle),
      );

  // DETAIL TITLE ======================================================================================================
  // BUILD =============================================================================================================

  BlocBuilder<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit,
          ChosenLocationDetailDynamicButtonOnCreateActivityScreenState>
      _buildDetailTitle(
    BuildContext context,
    LocationTemplateDynamicByUserState locationState,
    int index,
    TextStyle templateNameTextStyle,
    TextStyle chosenTemplateNameTextStyle,
  ) =>
          BlocBuilder<
              ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit,
              ChosenLocationDetailDynamicButtonOnCreateActivityScreenState>(
            builder: (context, chosenState) {
              return _displayDetailTitle(context, locationState, chosenState,
                  index, templateNameTextStyle, chosenTemplateNameTextStyle);
            },
          );

  // DISPLAY ===========================================================================================================
  AppHeaderText _displayDetailTitle(
      BuildContext context,
      LocationTemplateDynamicByUserState locationState,
      ChosenLocationDetailDynamicButtonOnCreateActivityScreenState chosenState,
      int index,
      TextStyle templateNameTextStyle,
      TextStyle chosenTemplateNameTextStyle) {
    return AppHeaderText(
        textLabel: _appFunctions.showString(
            _findDetailTitleText(context, locationState, chosenState, index),
            lenght: 18),
        textStyle: _chechWhetherAnyLocationHasNotBeenYetChosen(chosenState)
            ? templateNameTextStyle
            : _checkWhetherLocationDetailIsIsChosenOne(
                    locationState, chosenState, index)
                ? chosenTemplateNameTextStyle
                : templateNameTextStyle);
  }

  bool _checkWhetherLocationDetailIsIsChosenOne(
    LocationTemplateDynamicByUserState locationState,
    ChosenLocationDetailDynamicButtonOnCreateActivityScreenState chosenState,
    int index,
  ) =>
      _findLocationDetailId(locationState, index) ==
      _chosenLocationDetailId(chosenState);

  // METHODS ===========================================================================================================
  // Chosen Methods ----------------------------------------------------------------------------------------------------
  int? _chosenLocationDetailId(
    ChosenLocationDetailDynamicButtonOnCreateActivityScreenState chosenState,
  ) =>
      chosenState.chosenLocationDetailDynamicList.last.locationDetailId;

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _chechWhetherAnyLocationHasNotBeenYetChosen(
    ChosenLocationDetailDynamicButtonOnCreateActivityScreenState chosenState,
  ) =>
      chosenState.chosenLocationDetailDynamicList.isEmpty;

  // Find Methods -----------------------------------------------------------------------------------------------------
  int? _findLocationDetailId(
    LocationTemplateDynamicByUserState locationState,
    int index,
  ) =>
      locationState.locationTemplateDynamicList
          .elementAt(index)
          .locationDetailDynamic
          .locationDetailId;

  String _findDetailTitleText(
    BuildContext context,
    LocationTemplateDynamicByUserState locationState,
    ChosenLocationDetailDynamicButtonOnCreateActivityScreenState chosenState,
    int index,
  ) {
    if (chosenState.chosenLocationDetailDynamicList.isNotEmpty) {
      return _checkWhetherLocationDetailIsIsChosenOne(
              locationState, chosenState, index)
          ? '* ${_findLocationDetailTemplateName(locationState, index)}'
          : _findLocationDetailTemplateName(locationState, index);
    } else {
      return _findLocationDetailTemplateName(locationState, index);
    }
  }

  String _findLocationDetailTemplateName(
          LocationTemplateDynamicByUserState locationState, int index) =>
      locationState.locationTemplateDynamicList
          .elementAt(index)
          .locationTemplateName;
}
