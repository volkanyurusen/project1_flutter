import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ChosenConsistedActivityBody extends StatefulWidget {
  final double screenWidth;

  const ChosenConsistedActivityBody({
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  State<ChosenConsistedActivityBody> createState() =>
      _ChosenConsistedActivityBodyState();
}

class _ChosenConsistedActivityBodyState
    extends State<ChosenConsistedActivityBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: CustomColumn(children: [
        const CustomAppSizedBox(),
        BlocBuilder<
            ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit,
            ChosenActivityAmongConsistedActivityDynamicAttendedByUserState>(
          builder: (context, chosenState) {
            return Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: CustomColumn(children: [
                  ChosenConsistedActivityBodyActivityNameArea(
                      chosenState: chosenState),
                  ChosenConsistedActivityBodyHostArea(chosenState: chosenState),
                  ChosenConsistedActivityBodyAttendeeArea(
                      chosenState: chosenState,
                      screenWidth: widget.screenWidth),
                  ChosenConsistedActivityBodyAttendeeDetailArea(
                      screenWidth: widget.screenWidth),
                  // ChosenConsistedActivityBodyCancelAttendanceArea(
                  //     chosenState: chosenState),
                ]),
              ),
            );
          },
        ),
      ]),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        context
            .read<
                ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetBloc>()
            .add(LoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffset(
                createdActivityId: context
                    .read<
                        ChosenActivityAmongConsistedActivityDynamicAttendedByUserCubit>()
                    .state
                    .chosenConsistedActivityDynamicWithDistanceList
                    .first
                    .createdActivityDynamic
                    .createdActivityId!,
                offset: context
                    .read<
                        ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetBloc>()
                    .state
                    .consistedActivityDynamicWithDistanceList
                    .length));
      }
    }
  }
}
