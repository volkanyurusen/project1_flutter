import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/existence/local_widgets/local_widgets.dart';
import 'package:my_project/screens/existence/pop_ups/zpop_ups.dart';
import 'package:my_project/widgets/widget.dart';

class TemplateBodyActivityTemplateArea extends StatefulWidget {
  const TemplateBodyActivityTemplateArea({Key? key}) : super(key: key);

  @override
  State<TemplateBodyActivityTemplateArea> createState() =>
      _TemplateBodyActivityTemplateAreaState();
}

class _TemplateBodyActivityTemplateAreaState
    extends State<TemplateBodyActivityTemplateArea> {
  final AppFunctions _appFunctions = AppFunctions();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (context.read<ActivityTemplateDynamicByUserBloc>().state.hasReachedMax !=
        true) {
      _scrollController.addListener(_onScroll);
    }
    //
    //if (context.read<ActivityTemplateBloc>().state.status == Status.success) {
    //   context.read<ActivityTemplateDynamicByUserBloc>().add(
    //       LoadActivityTemplateDynamicByUserEvent(
    //           uId: AppNumberConstants().appUserId));
    // }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle? bodyLarge = context.textTheme.bodyLarge!;

    return Expanded(
      child: _bringActivityTemplatesFromDatabaseAndDisplayThem(bodyLarge),
    );
  }

  // SKELTON ===========================================================================================================
  HorizontalScrollBox _createActivityTemplateSkeltonArea() =>
      HorizontalScrollBox(
          child: CustomListViewBuilder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) =>
                  _displayActivityTemplateSkelton()));

  Padding _displayActivityTemplateSkelton() => Padding(
      padding: _appVisualConstants.rightMarginInGeneral,
      child: const SkeltonOfTemplates());

  // BLOC ==============================================================================================================
  BlocBuilder<ActivityTemplateDynamicByUserBloc,
          ActivityTemplateDynamicByUserState>
      _bringActivityTemplatesFromDatabaseAndDisplayThem(
    TextStyle bodyLarge,
  ) =>
          BlocBuilder<ActivityTemplateDynamicByUserBloc,
              ActivityTemplateDynamicByUserState>(
            builder: (context, templateState) {
              switch (templateState.status) {
                case StatusWithoutLoading.initial:
                  return _createActivityTemplateSkeltonArea();
                case StatusWithoutLoading.success:
                  if (templateState.activityTemplateDynamicList.isEmpty) {
                    return _displayNoTemplateCreatedWidget();
                  } else {
                    final ActivityTemplateDynamicByUserBloc
                        activityTemplateDynamicByUserBloc =
                        context.read<ActivityTemplateDynamicByUserBloc>();
                    return _createActivityTemplateArea(
                        activityTemplateDynamicByUserBloc,
                        templateState,
                        bodyLarge);
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: templateState.error);
              }
            },
          );

  // NO TEMPLATE =======================================================================================================
  // DISPLAY ===========================================================================================================
  InformationAboutExisting _displayNoTemplateCreatedWidget() =>
      const InformationAboutExisting(detailLabel: 'created activity template');

  // TEMPLATE AREA =====================================================================================================
  // CREATE ============================================================================================================
  HorizontalScrollBox _createActivityTemplateArea(
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
    ActivityTemplateDynamicByUserState templateState,
    TextStyle bodyLarge,
  ) =>
      HorizontalScrollBox(
        child: CustomListViewBuilder(
          scrollDirection: Axis.horizontal,
          itemCount: _findItemCount(templateState),
          controller: _scrollController,
          itemBuilder: (context, index) =>
              _displayActivityTemplateColumnOrBottomLoader(index, templateState,
                  context, activityTemplateDynamicByUserBloc, bodyLarge),
        ),
      );

  int _findItemCount(ActivityTemplateDynamicByUserState templateState) =>
      templateState.hasReachedMax == true
          ? templateState.activityTemplateDynamicList.length
          : templateState.activityTemplateDynamicList.length + 1;

  // DISPLAY ===========================================================================================================
  StatelessWidget _displayActivityTemplateColumnOrBottomLoader(
    int index,
    ActivityTemplateDynamicByUserState templateState,
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
    TextStyle bodyLarge,
  ) =>
      index >= templateState.activityTemplateDynamicList.length
          ? const BottomLoader()
          : _generateActivityTemplateColumn(
              context,
              activityTemplateDynamicByUserBloc,
              templateState,
              index,
              bodyLarge);

  // GENERATE ==========================================================================================================
  GestureDetector _generateActivityTemplateColumn(
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
    ActivityTemplateDynamicByUserState templateState,
    int index,
    TextStyle bodyLarge,
  ) =>
      GestureDetector(
        onTap: () => _updateActivityTemplate(
            context, activityTemplateDynamicByUserBloc, templateState, index),
        onLongPress: () => _deleteActivityTemplate(
            context, activityTemplateDynamicByUserBloc, templateState, index),
        child:
            _displayActivityTemplate(templateState, index, context, bodyLarge),
      );

  // DISPLAY ===========================================================================================================
  Column _displayActivityTemplate(
    ActivityTemplateDynamicByUserState templateState,
    int index,
    BuildContext context,
    TextStyle bodyLarge,
  ) {
    return Column(
      children: [
        _displayActivityTemplatePhoto(templateState, index),
        const CustomAppSizedBox(height: 9),
        _displayActivityTemplateName(context, templateState, index, bodyLarge),
        const CustomAppSizedBox(height: 9),
        //
        // _displayActivityTitle(context, templateState, index, bodyLarge ),
        // const CustomAppSizedBox(),
      ],
    );
  }

  Expanded _displayActivityTemplatePhoto(
    ActivityTemplateDynamicByUserState templateState,
    int index,
  ) =>
      Expanded(
          child: TemplateImageContainer(
              asset: findActivityTemplatePhoto(templateState, index)));

  AppHeaderText _displayActivityTemplateName(
    BuildContext context,
    ActivityTemplateDynamicByUserState templateState,
    int index,
    TextStyle bodyLarge,
  ) =>
      AppHeaderText(
          textLabel: _appFunctions
              .showString(_findActivityTemplateName(templateState, index)),
          textStyle: bodyLarge);

  // METHODS ===========================================================================================================
  void _updateActivityTemplate(
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
    ActivityTemplateDynamicByUserState templateState,
    int index,
  ) {
    _assignClickedActivityTemplateAsChosenActivityTemplate(
        context, templateState, index);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return ActivityTemplateUpdatingPopUp(
            activityTemplateDynamicByUserBloc:
                activityTemplateDynamicByUserBloc,
          );
        });
  }

  void _deleteActivityTemplate(
    BuildContext context,
    ActivityTemplateDynamicByUserBloc activityTemplateDynamicByUserBloc,
    ActivityTemplateDynamicByUserState templateState,
    int index,
  ) {
    _assignClickedActivityTemplateAsChosenActivityTemplate(
        context, templateState, index);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return ActivityTemplateDeletingPopUp(
              activityTemplateDynamicByUserBloc:
                  activityTemplateDynamicByUserBloc);
        });
  }

  void _assignClickedActivityTemplateAsChosenActivityTemplate(
    BuildContext context,
    ActivityTemplateDynamicByUserState templateState,
    int index,
  ) =>
      BlocProvider.of<
                  ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnUpdatingPopUpCubit>(
              context)
          .pressActivityTemplate(
              templateState.activityTemplateDynamicList.elementAt(index));

  // Find Method -------------------------------------------------------------------------------------------------------
  String findActivityTemplatePhoto(
          ActivityTemplateDynamicByUserState templateState, int index) =>
      'assets/images/activities/${templateState.activityTemplateDynamicList.elementAt(index).activityNameDynamic.activityTitle.toLowerCase()}.jpg';

  String _findActivityTemplateName(
    ActivityTemplateDynamicByUserState templateState,
    int index,
  ) =>
      templateState.activityTemplateDynamicList.elementAt(index).templateName;

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (context.read<ActivityTemplateDynamicByUserBloc>().state.hasReachedMax ==
        false) {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          context.read<ActivityTemplateDynamicByUserBloc>().add(
              LoadActivityTemplateDynamicByUserEvent(
                  uId: AppNumberConstants().appUserId,
                  offset: context
                      .read<ActivityTemplateDynamicByUserBloc>()
                      .state
                      .activityTemplateDynamicList
                      .length));
        }
      }
    }
  }
}
