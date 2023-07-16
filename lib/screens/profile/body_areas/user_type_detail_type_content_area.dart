import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/widgets/widget.dart';

class UserTypeDetailTypeContentArea extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();
  final AppListConstants _appListConstants = AppListConstants();
  final TextStyle? titleLarge;

  UserTypeDetailTypeContentArea({this.titleLarge, super.key});

  @override
  Widget build(BuildContext context) {
    return _createUserTypeDetailsColumn();
  }

  // USER TYPE DETAIL COLUMN ===========================================================================================
  // CREATE ============================================================================================================
  CustomColumn _createUserTypeDetailsColumn() {
    return CustomColumn(
      children: [
        _buildUserTypeDetails(),
      ],
    );
  }

  // USER TYPE DETAIL COLUMN ===========================================================================================
  // BUILD =============================================================================================================
  BlocBuilder<MembershipTypeBloc, MembershipTypeState> _buildUserTypeDetails() {
    return BlocBuilder<MembershipTypeBloc, MembershipTypeState>(
        builder: (context, membershipState) {
      switch (membershipState.status) {
        case Status.initial:
          return const TypeDetailSkelton();
        case Status.loading:
          return const TypeDetailSkelton();
        case Status.success:
          return CustomColumn(
            children: _generateListOfDetail(context, membershipState),
          );
        case Status.failure:
          return StateError(error: membershipState.error);
      }
    });
  }

  // LIST OF DETAIL ====================================================================================================
  // GENERATE ==========================================================================================================
  List<Widget> _generateListOfDetail(
      BuildContext context, MembershipTypeState membershipState) {
    return List.generate(
      _appListConstants.platinumMembershipTypeValue.length,
      (index) => _createDetailLine(context, membershipState, index),
    );
  }

  // DETAIL LINE =======================================================================================================
  // CREATE ============================================================================================================
  AppHeader _createDetailLine(
    BuildContext context,
    MembershipTypeState membershipState,
    int index,
  ) =>
      AppHeader(
        spaceFromUpperWidget: index == 0 ? 0 : 10,
        firstWidget: _createDetailTitleIconAndContentArea(
            context, membershipState, index),
        thirdWidget: _displayContent(context, membershipState, index),
      );

  // DETAIL TITLE AND ICON AREA ========================================================================================
  // CREATE ============================================================================================================
  AppHeader _createDetailTitleIconAndContentArea(
    BuildContext context,
    MembershipTypeState membershipState,
    int index,
  ) =>
      AppHeader(
          firstWidget: _displayCorrectIcon(context, membershipState, index),
          secondWidget: const CustomAppSizedBox(width: 5),
          thirdWidget: _displayDetailTitle(context, membershipState, index));

  // ICONS =============================================================================================================
  // DISPLAY ===========================================================================================================
  /// [_displayCorrectIcon] method displays the including ([Icons.done_sharp]) or excluding ([Icons.clear_sharp]) icons
  /// on the screen. [_bringValueOfMembershipTypeOfUser] method finds the values of the [MemberhipType] of the
  /// [User].
  ///
  /// When all the details of the [MemberhipType] of the [User] getting (these details get with
  /// [_getUserMembershipMatchingMembershipType] method)
  ///
  /// ''' dart
  /// _toJsonUserMembershipTypeDetail(context, membershipState).entries.elementAt(index + 2).value'''
  ///
  /// method finds the values of the [MemberhipType] of the [User].
  /// (The values can be only [True], [False], or [Number]).
  /// The meaning of these are;
  ///
  /// [True] means, that feature of the the membership includes in the [MembershipType] where [User] includes in.
  ///
  /// [False] means, that feature of the the membership includes in the [MembershipType] where [User] includes in.
  ///
  /// [Number] means, that feature of the the membership includes how many times in the [MembershipType] where [User]
  /// includes in.
  ///
  ///
  /// (The values can be only [True], [False], or [Number]).
  /// The meaning of these are;
  ///
  /// [True] means, that feature of the the membership includes in the [MembershipType] where [User] includes in.
  ///
  /// [False] means, that feature of the the membership includes in the [MembershipType] where [User] includes in.
  ///
  /// [Number] means, that feature of the the membership includes how many times in the [MembershipType] where [User]
  /// includes in.
  ///
  Icon _displayCorrectIcon(
      BuildContext context, MembershipTypeState membershipState, int index) {
    return _toJsonUserMembershipTypeDetail(context, membershipState)
                .entries
                .elementAt(index + 2)
                .value ==
            true
        ? _displayIncludedIcon()
        : _toJsonUserMembershipTypeDetail(context, membershipState)
                    .entries
                    .elementAt(index + 2)
                    .value ==
                false
            ? _displayExcludedIcon()
            : _toJsonUserMembershipTypeDetail(context, membershipState)
                        .entries
                        .elementAt(index + 2)
                        .value ==
                    0
                ? _displayExcludedIcon()
                : _displayIncludedIcon();
  }

  //
  // _bringValueOfMembershipTypeOfUser(context, membershipState, index) == true
  //     ? _displayIncludedIcon()
  //     : _bringValueOfMembershipTypeOfUser(
  //                 context, membershipState, index) ==
  //             false
  //         ? _displayExcludedIcon()
  //         : _bringValueOfMembershipTypeOfUser(
  //                     context, membershipState, index) ==
  //                 0
  //             ? _displayExcludedIcon()
  //             : _displayIncludedIcon();

  Icon _displayIncludedIcon() => const Icon(Icons.done_sharp, size: 18);

  Icon _displayExcludedIcon() => const Icon(Icons.clear_sharp, size: 18);

  // METHODS ===========================================================================================================
  // Bring Methods -----------------------------------------------------------------------------------------------------

  // _bringValueOfMembershipTypeOfUser(
  //     BuildContext context, MembershipTypeState membershipState, int index) {
  //   _toJsonUserMembershipTypeDetail(context, membershipState)
  //       .entries
  //       .elementAt(index + 2)
  //       .value;
  // }

  // GENERAL METHODS ===================================================================================================
  // ToJson Methods ----------------------------------------------------------------------------------------------------
  /// After [_getUserMembershipMatchingMembershipType] complates it own task (which means when the method finds the
  /// [MemberhipType] of the [User], [_toJsonUserMembershipTypeDetail] method convert it to map type (with [toJson]
  /// method).
  ///
  /// The reason of using this method is to get the keys and valuesof the [MembershipType]'s model. Because the keys
  /// and values will display on the screen to show the users in order to inform them with the [MembershipType]'s
  /// contents which they are included in.
  Map<String, dynamic> _toJsonUserMembershipTypeDetail(
          BuildContext context, MembershipTypeState membershipState) =>
      _getUserMembershipMatchingMembershipType(context, membershipState)
          .first
          .toJson();

  // Get Methods -------------------------------------------------------------------------------------------------------
  /// These code block check all [MembershipTypes] with [membershipTypeName] one by one (with where condition). And
  /// compares each of them with user's [membershipTypeName] ([_findMembershipTypeName] method finds user's
  /// [membershipTypeName]).

  Iterable<MembershipType> _getUserMembershipMatchingMembershipType(
    BuildContext context,
    MembershipTypeState membershipState,
  ) =>
      membershipState.membershipTypeList.where((element) =>
          element.membershipTypeName == _findMembershipTypeName(context));

  // DETAIL TITLE ======================================================================================================
  // DISPLAY ===========================================================================================================
  /// [_displayCorrectIcon] method displays the including ([Icons.done_sharp]) or excluding ([Icons.clear_sharp]) icons
  /// on the screen. [_bringValueOfMembershipTypeOfUser] method finds the values of the [MemberhipType] of the
  /// [User].

  AppHeaderText _displayDetailTitle(
    BuildContext context,
    MembershipTypeState membershipState,
    int index,
  ) =>
      AppHeaderText(
          textLabel: _findDetailTitleText(context, membershipState, index)
              .toCapitalized(),
          textStyle: titleLarge);

  // METHODS ===========================================================================================================
  // Bring Methods -----------------------------------------------------------------------------------------------------
  /// When all the details of the [MemberhipType] of the [User] getting (these details get with
  /// [_getUserMembershipMatchingMembershipType] method) [_bringKeyOfMembershipTypeOfUser]
  /// method finds the key of the [MemberhipType] of the [User].

  String _bringKeyOfMembershipTypeOfUser(BuildContext context,
          MembershipTypeState membershipState, int index) =>
      _toJsonUserMembershipTypeDetail(context, membershipState)
          .entries
          .elementAt(index + 2)
          .key;

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findMembershipTypeName(BuildContext context) => context
      .read<UserDynamicBloc>()
      .state
      .userDynamicList
      .last
      .membershipTypeDynamic
      .membershipTypeName;

  String _findDetailTitleText(
    BuildContext context,
    MembershipTypeState membershipState,
    int index,
  ) =>
      _appFunctions.setWithoutUnderscore(
          _bringKeyOfMembershipTypeOfUser(context, membershipState, index));

  // DETAIL TITLE CONTENT AREA =========================================================================================
  // DISPLAY ===========================================================================================================
  AppHeaderText _displayContent(
    BuildContext context,
    MembershipTypeState membershipState,
    int index,
  ) =>
      AppHeaderText(
          textLabel: _findContentText(context, membershipState, index),
          textStyle: titleLarge);

  // METHODS ===========================================================================================================
  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findContentText(BuildContext context,
          MembershipTypeState membershipState, int index) =>
      _toJsonUserMembershipTypeDetail(context, membershipState)
                  .entries
                  .elementAt(index + 2)
                  .value ==
              true
          ? 'Included'
          : _toJsonUserMembershipTypeDetail(context, membershipState)
                      .entries
                      .elementAt(index + 2)
                      .value ==
                  false
              ? 'Excluded'
              : _toJsonUserMembershipTypeDetail(context, membershipState)
                          .entries
                          .elementAt(index + 2)
                          .value ==
                      0
                  ? 'None'
                  : _findMembershipTypeName(context) == 'Basic User'
                      ? _toJsonUserMembershipTypeDetail(context, membershipState)
                              .entries
                              .elementAt(index + 2)
                              .value
                              .toString() +
                          _appListConstants.basicMembershipTypeValue
                              .elementAt(index)
                      : _toJsonUserMembershipTypeDetail(context, membershipState)
                              .entries
                              .elementAt(index + 2)
                              .value
                              .toString() +
                          _appListConstants.platinumMembershipTypeValue
                              .elementAt(index);
}
