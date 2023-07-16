import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/discover/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class ScreenOfUserCardDetail extends StatelessWidget {
  static const String routeName = 'screen_of_user_card_detail';

  const ScreenOfUserCardDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResultOfPreferredActivityDynamicBloc resultOfPreferredActivityDynamicBloc =
        context.read<ResultOfPreferredActivityDynamicBloc>();
    final ConsistedActivityDynamicWithDistanceAttendedByUserBloc
        consistedActivityDynamicWithDistanceAttendedByUserBloc =
        context.read<ConsistedActivityDynamicWithDistanceAttendedByUserBloc>();
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: UserCardDetailBody(
            resultOfPreferredActivityDynamicBloc:
                resultOfPreferredActivityDynamicBloc,
            consistedActivityDynamicWithDistanceAttendedByUserBloc:
                consistedActivityDynamicWithDistanceAttendedByUserBloc),
      ),
    );
  }
}
