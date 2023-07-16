import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

import '../zscreens.dart';

class ProfileBodyTypeDetailsArea extends StatelessWidget {
  final TextStyle headlineMedium;
  final TextStyle titleHeadline;

  const ProfileBodyTypeDetailsArea({
    required this.headlineMedium,
    required this.titleHeadline,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MembershipTypeBloc membershipTypeBloc =
        context.read<MembershipTypeBloc>();
    final CoachingTypeBloc coachingTypeBloc = context.read<CoachingTypeBloc>();

    return CustomColumn(children: [
      AppHeaderText(textLabel: 'Type Details', textStyle: titleHeadline),
      CustomAppDivider(),
      const CustomAppSizedBox(height: 20),
      GestureDetector(
          onTap: () => _goToUserTypeDetailsScreenWhileBringingNecessaryBloc(
              context, membershipTypeBloc),
          child: AppHeaderText(
              textLabel: 'User Types', textStyle: headlineMedium)),
      const CustomAppSizedBox(height: 30),
      GestureDetector(
          onTap: () => _goToCoachingTypeDetailsScreenWhileBringingNecessaryBloc(
              context, coachingTypeBloc),
          child: AppHeaderText(
              textLabel: 'Coaching Types', textStyle: headlineMedium)),
      const CustomAppSizedBox(height: 40),
    ]);
  }

  _goToUserTypeDetailsScreenWhileBringingNecessaryBloc(
    BuildContext context,
    MembershipTypeBloc membershipTypeBloc,
  ) {
    membershipTypeBloc.add(LoadMembershipTypeEvent());
    Navigator.of(context).pushNamed(ScreenOfUserTypes.routeName);
  }

  _goToCoachingTypeDetailsScreenWhileBringingNecessaryBloc(
    BuildContext context,
    CoachingTypeBloc coachingTypeBloc,
  ) {
    coachingTypeBloc.add(LoadCoachingTypeEvent());
    Navigator.of(context).pushNamed(ScreenOfCoachingTypes.routeName);
  }
}
