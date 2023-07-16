import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';

import 'package:my_project/widgets/widget.dart';

import '../zscreens.dart';

class ProfileBodyCoachingDetailsArea extends StatelessWidget {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final TextStyle headlineMedium;
  final TextStyle titleHeadline;

  ProfileBodyCoachingDetailsArea({
    required this.headlineMedium,
    required this.titleHeadline,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CoachBloc coachBloc = context.read<CoachBloc>();
    final CoachingExperienceDynamicBloc coachingExperienceDynamicBloc =
        context.read<CoachingExperienceDynamicBloc>();

    return CustomColumn(children: [
      AppHeaderText(textLabel: 'Coaching Details', textStyle: titleHeadline),
      CustomAppDivider(),
      const CustomAppSizedBox(height: 20),
      BlocBuilder<CoachDynamicBloc, CoachDynamicState>(
        builder: (context, state) {
          return CustomColumn(
            children: [
              GestureDetector(
                  onTap: () {
                    _checkWhetherUserIsCoach(state)
                        ? _goToCoachingDetailsScreenWhileBringingNecessaryBloc(
                            context, coachBloc, coachingExperienceDynamicBloc)
                        : debugPrint('Become a Coach button has been click');
                  },
                  child: AppHeaderText(
                      textLabel: _checkWhetherUserIsCoach(state)
                          ? 'Coaching Details'
                          : 'Become a Coach',
                      textStyle: headlineMedium)),
              const CustomAppSizedBox(height: 30),
              _checkWhetherUserIsCoach(state)
                  ? GestureDetector(
                      onTap: () =>
                          _goToCoachingTypeDetailsScreenWhileBringingNecessaryBloc(
                              context),
                      child: AppHeaderText(
                          textLabel: 'Coaching Type Details',
                          textStyle: headlineMedium))
                  : const SizedBox(),
            ],
          );
        },
      ),
      const CustomAppSizedBox(height: 40),
    ]);
  }

  /// METHODS ==========================================================================================================
  void _goToCoachingDetailsScreenWhileBringingNecessaryBloc(
    BuildContext context,
    CoachBloc coachBloc,
    CoachingExperienceDynamicBloc coachingExperienceDynamicBloc,
  ) {
    _bringCoachFromDB(coachBloc);
    _bringCoachingExperienceDynamicFromDB(coachingExperienceDynamicBloc);
    _goToCoachingDetailScreen(context);
  }

  /// Check Mehotds ----------------------------------------------------------------------------------------------------
  bool _checkWhetherUserIsCoach(CoachDynamicState state) =>
      state.coachDynamicList.isNotEmpty;

  /// Database Mehotds -------------------------------------------------------------------------------------------------
  void _bringCoachFromDB(CoachBloc coachBloc) =>
      coachBloc.add(LoadCoachEvent(coachId: _appNumberConstants.appCoachId));

  void _bringCoachingExperienceDynamicFromDB(
    CoachingExperienceDynamicBloc coachingExperienceDynamicBloc,
  ) =>
      coachingExperienceDynamicBloc.add(LoadCoachingExperienceDynamicEvent());

  /// Screen Mehotds ---------------------------------------------------------------------------------------------------
  void _goToCoachingDetailScreen(BuildContext context) =>
      Navigator.of(context).pushNamed(ScreenOfCoachingDetails.routeName);

  _goToCoachingTypeDetailsScreenWhileBringingNecessaryBloc(
    BuildContext context,
  ) {
    Navigator.of(context).pushNamed(ScreenOfCoachingTypeDetails.routeName);
  }
}
