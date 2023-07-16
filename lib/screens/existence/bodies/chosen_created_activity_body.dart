import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import '../body_areas/zareas.dart';

class ChosenCreatedActivityBody extends StatefulWidget {
  final double screenWidth;

  const ChosenCreatedActivityBody({
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  State<ChosenCreatedActivityBody> createState() =>
      _ChosenCreatedActivityBodyState();
}

class _ChosenCreatedActivityBodyState extends State<ChosenCreatedActivityBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: CustomColumn(
        children: [
          const CustomAppSizedBox(),
          BlocBuilder<
              ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit,
              ChosenActivityAmongCreatedActivityDynamicCreatedByUserState>(
            builder: (context, chosenState) {
              return Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: CustomColumn(children: [
                    ChosenCreatedActivityBodyActivityNameArea(
                        chosenState: chosenState),
                    ChosenCreatedActivityBodyAttendeeArea(
                        chosenState: chosenState,
                        screenWidth: widget.screenWidth),
                    ChosenCreatedActivityBodyProcessDetailArea(
                        screenWidth: widget.screenWidth),
                    
                  ]),
                ),
              );
            },
          ),
        ],
      ),
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
                ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessBloc>()
            .add(LoadConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcess(
                createdActivityId: context
                    .read<
                        ChosenActivityAmongCreatedActivityDynamicCreatedByUserCubit>()
                    .state
                    .chosenCreatedActivityDynamicWithDistanceList
                    .first
                    .createdActivityId!,
                offset: context
                    .read<
                        ConsistedActivityDynamicWithDistanceByCreatedActivityWithOffsetAndProcessBloc>()
                    .state
                    .consistedActivityDynamicWithDistanceList
                    .length));
      }
    }
  }
}
