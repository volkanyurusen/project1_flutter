import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/profile/local_widgets/zlocal_widget.dart';
import 'package:my_project/screens/profile/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class UserTypesBodyUserTypeCardArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppListConstants _appListConstants = AppListConstants();

  UserTypesBodyUserTypeCardArea({super.key});

  @override
  Widget build(BuildContext context) {
    Color whiteColor = _appColors.scaffoldBackgroundColor;
    TextStyle? titleStyle =
        context.textTheme.displayMedium!.copyWith(color: whiteColor);
    TextStyle? detailStyle =
        context.textTheme.titleLarge!.copyWith(color: whiteColor);
    return _createCardOfUserTypeColumn(
        context, whiteColor, titleStyle, detailStyle);
  }

  // SKELTON ===========================================================================================================
  CustomColumn _createUserTypeCardSkelton() => CustomColumn(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            2, (index) => TypeCardContainer(index: index, havingOpacity: true)),
      );

  // CREATE ============================================================================================================
  ScreenContainerWithBackgroundPhoto _createCardOfUserTypeColumn(
    BuildContext context,
    Color whiteColor,
    TextStyle titleStyle,
    TextStyle detailStyle,
  ) =>
      ScreenContainerWithBackgroundPhoto(
        backgroundImage:
            AssetImage('assets/images/user_types/0${Random().nextInt(2)}.jpg'),
        child: _buildUserTypeCardArea(whiteColor, titleStyle, detailStyle),
      );

  // BUILD =============================================================================================================
  BlocBuilder<MembershipTypeBloc, MembershipTypeState> _buildUserTypeCardArea(
      Color whiteColor, TextStyle titleStyle, TextStyle detailStyle) {
    return BlocBuilder<MembershipTypeBloc, MembershipTypeState>(
      builder: (context, membershipState) {
        switch (membershipState.status) {
          case Status.initial:
            return _createUserTypeCardSkelton();
          case Status.loading:
            return _createUserTypeCardSkelton();
          case Status.success:
            return _createUserTypeCardArea(
                context, membershipState, whiteColor, titleStyle, detailStyle);
          case Status.failure:
            return StateError(error: membershipState.error);
        }
      },
    );
  }

  // TYPE CARD =========================================================================================================
  // BUILD =============================================================================================================
  CustomColumn _createUserTypeCardArea(
    BuildContext context,
    MembershipTypeState membershipState,
    Color whiteColor,
    TextStyle titleStyle,
    TextStyle detailStyle,
  ) =>
      CustomColumn(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _generateUserTypeCard(
            context, membershipState, whiteColor, titleStyle, detailStyle),
      );

  // GENERATE ==========================================================================================================
  List<Widget> _generateUserTypeCard(
          BuildContext context,
          MembershipTypeState membershipState,
          Color whiteColor,
          TextStyle titleStyle,
          TextStyle detailStyle) =>
      List.generate(
          membershipState.membershipTypeList.length,
          (index) => GestureDetector(
                onTap: () =>
                    _goToChosenUserTypeScreen(context, membershipState, index),
                child: _createUserCardContainerArea(context, membershipState,
                    index, whiteColor, titleStyle, detailStyle),
              ));

  // CREATE ============================================================================================================
  TypeCardContainer _createUserCardContainerArea(
      BuildContext context,
      MembershipTypeState membershipState,
      int index,
      Color whiteColor,
      TextStyle titleStyle,
      TextStyle detailStyle) {
    return TypeCardContainer(
      index: index,
      havingOpacity: false,
      child: _createUserCardRow(
          context, membershipState, index, whiteColor, titleStyle, detailStyle),
    );
  }

  Row _createUserCardRow(
          BuildContext context,
          MembershipTypeState membershipState,
          int index,
          Color whiteColor,
          TextStyle titleStyle,
          TextStyle detailStyle) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _createLeftSideOfUserTypeCard(membershipState, index, titleStyle),
          _displayVerticalDivider(context, whiteColor),
          _createRightSideOfUserTypeCard(
              membershipState, index, whiteColor, titleStyle, detailStyle),
        ],
      );

  // DISPLAY ==========================================================================================================
  Container _displayVerticalDivider(BuildContext context, Color whiteColor) =>
      Container(height: context.height / 4, width: 2, color: whiteColor);

  // LEFT SIDE OF CARD TYPE ============================================================================================
  // CREATE ============================================================================================================
  TypeCardContentArea _createLeftSideOfUserTypeCard(
    MembershipTypeState membershipState,
    int index,
    TextStyle titleStyle,
  ) =>
      TypeCardContentArea(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TypeCardTypeIcon(
              child: _appListConstants.typeIcon.elementAt(index)),
          const CustomAppSizedBox(),
          _displayUserTypeName(membershipState, index, titleStyle)
        ],
      );

  // DISPLAY ===========================================================================================================
  AppHeaderText _displayUserTypeName(
    MembershipTypeState membershipState,
    int index,
    TextStyle titleStyle,
  ) =>
      AppHeaderText(
          textLabel: _findMembershipTypeName(membershipState, index),
          textStyle: titleStyle);

  // METHODS ===========================================================================================================
  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findMembershipTypeName(
          MembershipTypeState membershipState, int index) =>
      membershipState.membershipTypeList.elementAt(index).membershipTypeName;

  // RIGHT SIDE OF CARD TYPE ===========================================================================================
  // CREATE ============================================================================================================
  TypeCardContentArea _createRightSideOfUserTypeCard(
    MembershipTypeState membershipState,
    int index,
    Color whiteColor,
    TextStyle titleStyle,
    TextStyle detailStyle,
  ) =>
      TypeCardContentArea(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _createUserCardTypeSummaryDetailArea(
              membershipState, index, titleStyle, detailStyle),
          _createSeeAllDetailArea(detailStyle, whiteColor),
        ],
      );

  // DETAIL AREA =======================================================================================================
  // CREATE ============================================================================================================
  Column _createUserCardTypeSummaryDetailArea(
    MembershipTypeState membershipState,
    int index,
    TextStyle titleStyle,
    TextStyle detailStyle,
  ) =>
      Column(
        children: [
          _displayMonthlyPrice(membershipState, index, titleStyle),
          const CustomAppSizedBox(),
          AppHeaderText(
              textLabel:
                  _appListConstants.typeSummaryDescription.elementAt(index),
              textStyle: detailStyle),
        ],
      );

  // DISPLAY ===========================================================================================================
  AppHeaderText _displayMonthlyPrice(MembershipTypeState membershipState,
          int index, TextStyle titleStyle) =>
      AppHeaderText(
          textLabel: _checkAndFindMonthlyPrice(membershipState, index),
          textStyle: titleStyle);

  // METHOD ============================================================================================================
  String _checkAndFindMonthlyPrice(
          MembershipTypeState membershipState, int index) =>
      _checkWhetherMonthlyPriceIsZero(membershipState, index)
          ? 'Free'
          : _findMonthlyPrice(membershipState, index).toString();

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherMonthlyPriceIsZero(
          MembershipTypeState membershipState, int index) =>
      _findMonthlyPrice(membershipState, index) == 0;

  // Find Methods ------------------------------------------------------------------------------------------------------
  double _findMonthlyPrice(MembershipTypeState membershipState, int index) =>
      membershipState.membershipTypeList.elementAt(index).monthlyPrice;

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
  void _goToChosenUserTypeScreen(
    BuildContext context,
    MembershipTypeState membershipState,
    int index,
  ) {
    context.read<ChosenMembershipTypeCubit>().pressChosenMembershipType(
        membershipState.membershipTypeList.elementAt(index));
    Navigator.of(context).pushNamed(ScreenOfChosenUserType.routeName);
  }
}
