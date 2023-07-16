import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/profile/local_widgets/zlocal_widget.dart';
import 'package:my_project/screens/profile/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class CoachingTypesBodyCoachingTypeCardArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppListConstants _appListConstants = AppListConstants();

  CoachingTypesBodyCoachingTypeCardArea({super.key});

  @override
  Widget build(BuildContext context) {
    Color whiteColor = _appColors.scaffoldBackgroundColor;
    TextStyle? titleStyle =
        context.textTheme.displayMedium!.copyWith(color: whiteColor);
    TextStyle? detailStyle =
        context.textTheme.titleLarge!.copyWith(color: whiteColor);
    return _createCardOfCoachingTypeColumn(
        context, whiteColor, titleStyle, detailStyle);
  }

  // SKELTON ===========================================================================================================
  CustomColumn _createCoachingTypeCardSkelton() => CustomColumn(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            2, (index) => TypeCardContainer(index: index, havingOpacity: true)),
      );

  // CREATE ============================================================================================================
  ScreenContainerWithBackgroundPhoto _createCardOfCoachingTypeColumn(
    BuildContext context,
    Color whiteColor,
    TextStyle titleStyle,
    TextStyle detailStyle,
  ) =>
      ScreenContainerWithBackgroundPhoto(
        backgroundImage: AssetImage(
            'assets/images/coaching_types/0${Random().nextInt(2)}.jpg'),
        child: _buildCoachingTypeCardArea(whiteColor, titleStyle, detailStyle),
      );

  // BUILD =============================================================================================================
  BlocBuilder<CoachingTypeBloc, CoachingTypeState> _buildCoachingTypeCardArea(
      Color whiteColor, TextStyle titleStyle, TextStyle detailStyle) {
    return BlocBuilder<CoachingTypeBloc, CoachingTypeState>(
      builder: (context, coachingState) {
        switch (coachingState.status) {
          case Status.initial:
            return _createCoachingTypeCardSkelton();
          case Status.loading:
            return _createCoachingTypeCardSkelton();
          case Status.success:
            return _createCoachingTypeCardArea(
                context, coachingState, whiteColor, titleStyle, detailStyle);
          case Status.failure:
            return StateError(error: coachingState.error);
        }
      },
    );
  }

  // TYPE CARD =========================================================================================================
  // BUILD =============================================================================================================
  CustomColumn _createCoachingTypeCardArea(
    BuildContext context,
    CoachingTypeState coachingState,
    Color whiteColor,
    TextStyle titleStyle,
    TextStyle detailStyle,
  ) =>
      CustomColumn(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _generateCoachingTypeCard(
            context, coachingState, whiteColor, titleStyle, detailStyle),
      );

  // GENERATE ==========================================================================================================
  List<Widget> _generateCoachingTypeCard(
          BuildContext context,
          CoachingTypeState coachingState,
          Color whiteColor,
          TextStyle titleStyle,
          TextStyle detailStyle) =>
      List.generate(
          coachingState.coachingTypeList.length,
          (index) => GestureDetector(
                onTap: () => _goToChosenCoachingTypeScreen(
                    context, coachingState, index),
                child: _createCoachingCardContainerArea(context, coachingState,
                    index, whiteColor, titleStyle, detailStyle),
              ));

  // CREATE ============================================================================================================
  TypeCardContainer _createCoachingCardContainerArea(
      BuildContext context,
      CoachingTypeState coachingState,
      int index,
      Color whiteColor,
      TextStyle titleStyle,
      TextStyle detailStyle) {
    return TypeCardContainer(
      index: index,
      havingOpacity: false,
      child: _createCoachingCardRow(
          context, coachingState, index, whiteColor, titleStyle, detailStyle),
    );
  }

  Row _createCoachingCardRow(
          BuildContext context,
          CoachingTypeState coachingState,
          int index,
          Color whiteColor,
          TextStyle titleStyle,
          TextStyle detailStyle) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _createLeftSideOfTypeCard(coachingState, index, titleStyle),
          _displayVerticalDivider(context, whiteColor),
          _createRightSideOfTypeCard(
              coachingState, index, whiteColor, titleStyle, detailStyle),
        ],
      );

  // DISPLAY ==========================================================================================================
  Container _displayVerticalDivider(BuildContext context, Color whiteColor) =>
      Container(height: context.height / 4, width: 2, color: whiteColor);

  // LEFT SIDE OF CARD TYPE ============================================================================================
  // CREATE ============================================================================================================
  TypeCardContentArea _createLeftSideOfTypeCard(
    CoachingTypeState coachingState,
    int index,
    TextStyle titleStyle,
  ) =>
      TypeCardContentArea(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TypeCardTypeIcon(child: _appListConstants.typeIcon.elementAt(index)),
          const CustomAppSizedBox(),
          _displayTypeName(coachingState, index, titleStyle)
        ],
      );

  // DISPLAY ===========================================================================================================
  AppHeaderText _displayTypeName(
    CoachingTypeState coachingState,
    int index,
    TextStyle titleStyle,
  ) =>
      AppHeaderText(
          textLabel: _findCoachingTypeName(coachingState, index),
          textStyle: titleStyle);

  // METHODS ===========================================================================================================
  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findCoachingTypeName(CoachingTypeState coachingState, int index) =>
      coachingState.coachingTypeList.elementAt(index).coachingTypeName;

  // RIGHT SIDE OF CARD TYPE ===========================================================================================
  // CREATE ============================================================================================================
  TypeCardContentArea _createRightSideOfTypeCard(
    CoachingTypeState coachingState,
    int index,
    Color whiteColor,
    TextStyle titleStyle,
    TextStyle detailStyle,
  ) =>
      TypeCardContentArea(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _createTypeCardTypeSummaryDetailArea(
              coachingState, index, titleStyle, detailStyle),
          _createSeeAllDetailArea(detailStyle, whiteColor),
        ],
      );

  // DETAIL AREA =======================================================================================================
  // CREATE ============================================================================================================
  Column _createTypeCardTypeSummaryDetailArea(
    CoachingTypeState coachingState,
    int index,
    TextStyle titleStyle,
    TextStyle detailStyle,
  ) =>
      Column(
        children: [
          _displayMonthlyPrice(coachingState, index, titleStyle),
          const CustomAppSizedBox(),
          AppHeaderText(
              textLabel:
                  _appListConstants.typeSummaryDescription.elementAt(index),
              textStyle: detailStyle),
        ],
      );

  // DISPLAY ===========================================================================================================
  AppHeaderText _displayMonthlyPrice(
          CoachingTypeState coachingState, int index, TextStyle titleStyle) =>
      AppHeaderText(
          textLabel: _checkAndFindMonthlyPrice(coachingState, index),
          textStyle: titleStyle);

  // METHOD ============================================================================================================
  String _checkAndFindMonthlyPrice(
          CoachingTypeState coachingState, int index) =>
      _checkWhetherMonthlyPriceIsZero(coachingState, index)
          ? 'Free'
          : _findMonthlyPrice(coachingState, index).toString();

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherMonthlyPriceIsZero(
          CoachingTypeState coachingState, int index) =>
      _findMonthlyPrice(coachingState, index) == 0;

  // Find Methods ------------------------------------------------------------------------------------------------------
  double _findMonthlyPrice(CoachingTypeState coachingState, int index) =>
      coachingState.coachingTypeList.elementAt(index).monthlyPrice;

  // DETAIL AREA =======================================================================================================
  // CREATE ============================================================================================================
  CustomRow _createSeeAllDetailArea(TextStyle detailStyle, Color whiteColor) =>
      CustomRow(children: [
        _displaySeeDetailsText(detailStyle),
        const CustomAppSizedBox(width: 5),
        _displayArrowIcon(whiteColor),
      ]);

  // DISPLAY ===========================================================================================================
  AppHeaderText _displaySeeDetailsText(TextStyle detailStyle) =>
      AppHeaderText(textLabel: 'See details', textStyle: detailStyle);

  Icon _displayArrowIcon(Color whiteColor) =>
      Icon(Icons.double_arrow_rounded, color: whiteColor, size: 18);

  // METHODS ===========================================================================================================
  // Screen Methods ----------------------------------------------------------------------------------------------------
  void _goToChosenCoachingTypeScreen(
    BuildContext context,
    CoachingTypeState coachingState,
    int index,
  ) {
    context.read<ChosenCoachingTypeCubit>().pressChosenCoachingType(
        coachingState.coachingTypeList.elementAt(index));
    Navigator.of(context).pushNamed(ScreenOfChosenCoachingType.routeName);
  }
}
