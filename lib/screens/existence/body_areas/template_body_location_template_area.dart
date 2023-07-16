import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/existence/local_widgets/local_widgets.dart';
import 'package:my_project/screens/existence/pop_ups/zpop_ups.dart';
import 'package:my_project/widgets/widget.dart';

class TemplateBodyLocationTemplateArea extends StatefulWidget {
  const TemplateBodyLocationTemplateArea({Key? key}) : super(key: key);

  @override
  State<TemplateBodyLocationTemplateArea> createState() =>
      _TemplateBodyLocationTemplateAreaState();
}

class _TemplateBodyLocationTemplateAreaState
    extends State<TemplateBodyLocationTemplateArea> {
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (context.read<LocationTemplateDynamicByUserBloc>().state.hasReachedMax !=
        true) {
      _scrollController.addListener(_onScroll);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.height;
    double screenWidth = context.width;
    TextStyle? bodyLarge = context.textTheme.bodyLarge!;

    return _bringLocationTemplatesFromDatabaseAndDisplayThem(
        screenHeight, screenWidth, bodyLarge);
  }

  // SKELTON ===========================================================================================================
  HorizontalScrollBox _createLocationTemplateSkeltonArea(
    BuildContext context,
    double screenHeight,
    double screenWidth,
  ) =>
      HorizontalScrollBox(
          height: 100,
          child: CustomListViewBuilder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) =>
                  _displayLocationTemplateSkelton(context, screenWidth)));

  Padding _displayLocationTemplateSkelton(
    BuildContext context,
    double screenWidth,
  ) =>
      Padding(
          padding: _appVisualConstants.rightMarginInGeneral,
          child: SkeltonOfTemplates(width: screenWidth * 0.38));

  // BLOC ==============================================================================================================
  BlocBuilder<LocationTemplateDynamicByUserBloc,
          LocationTemplateDynamicByUserState>
      _bringLocationTemplatesFromDatabaseAndDisplayThem(
    double screenHeight,
    double screenWidth,
    TextStyle bodyLarge,
  ) =>
          BlocBuilder<LocationTemplateDynamicByUserBloc,
              LocationTemplateDynamicByUserState>(
            builder: (context, templateState) {
              switch (templateState.status) {
                case StatusWithoutLoading.initial:
                  return _createLocationTemplateSkeltonArea(
                      context, screenHeight, screenWidth);
                case StatusWithoutLoading.success:
                  if (templateState.locationTemplateDynamicList.isEmpty) {
                    return _displayNoTemplateCreatedWidget();
                  } else {
                    final LocationTemplateDynamicByUserBloc
                        locationTemplateDynamicByUserBloc =
                        context.read<LocationTemplateDynamicByUserBloc>();
                    return _createLocationTemplateArea(
                        locationTemplateDynamicByUserBloc,
                        templateState,
                        screenWidth,
                        bodyLarge);
                  }
                case StatusWithoutLoading.failure:
                  return StateError(error: templateState.error);
              }
            },
          );

  // NO TEMPLATE =======================================================================================================
  // DISPLAY ===========================================================================================================
  SizedBox _displayNoTemplateCreatedWidget() => const SizedBox(
      height: 100,
      child:
          InformationAboutExisting(detailLabel: 'created location template'));

  // TEMPLATE AREA =====================================================================================================
  // CREATE ============================================================================================================
  HorizontalScrollBox _createLocationTemplateArea(
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
    LocationTemplateDynamicByUserState templateState,
    double screenWidth,
    TextStyle bodyLarge,
  ) =>
      HorizontalScrollBox(
          height: 100,
          child: CustomListViewBuilder(
              scrollDirection: Axis.horizontal,
              itemCount: _findItemCount(templateState),
              controller: _scrollController,
              itemBuilder: (context, index) =>
                  _displayLocationTemplateColumnOrBottomLoader(
                      context,
                      locationTemplateDynamicByUserBloc,
                      templateState,
                      index,
                      screenWidth,
                      bodyLarge)));

  int _findItemCount(LocationTemplateDynamicByUserState templateState) =>
      templateState.hasReachedMax == true
          ? templateState.locationTemplateDynamicList.length
          : templateState.locationTemplateDynamicList.length + 1;

  // DISPLAY ===========================================================================================================
  StatelessWidget _displayLocationTemplateColumnOrBottomLoader(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
    LocationTemplateDynamicByUserState templateState,
    int index,
    double screenWidth,
    TextStyle bodyLarge,
  ) =>
      index >= templateState.locationTemplateDynamicList.length
          ? const BottomLoader()
          : _generateLocationTemplateColumn(
              context,
              locationTemplateDynamicByUserBloc,
              templateState,
              screenWidth,
              index,
              bodyLarge);

  // GENERATE ==========================================================================================================
  GestureDetector _generateLocationTemplateColumn(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
    LocationTemplateDynamicByUserState templateState,
    double screenWidth,
    int index,
    TextStyle bodyLarge,
  ) {
    return GestureDetector(
      onTap: () => _updateLocationTemplate(
          context, locationTemplateDynamicByUserBloc, templateState, index),
      onLongPress: () => _deleteLocationTemplate(
          context, locationTemplateDynamicByUserBloc, templateState, index),
      child: _displayLocatiomTemplate(
          context, templateState, screenWidth, index, bodyLarge),
    );
  }

  // DISPLAY ===========================================================================================================
  Column _displayLocatiomTemplate(
    BuildContext context,
    LocationTemplateDynamicByUserState templateState,
    double screenWidth,
    int index,
    TextStyle bodyLarge,
  ) =>
      Column(
        children: [
          _displayLocationTemplatePhoto(context, screenWidth),
          const CustomAppSizedBox(height: 9),
          _displayLocationTemplateName(templateState, index, bodyLarge),
        ],
      );

  AppHeaderText _displayLocationTemplateName(
    LocationTemplateDynamicByUserState templateState,
    int index,
    TextStyle bodyLarge,
  ) =>
      AppHeaderText(
          textLabel: _findLocationTemplateName(templateState, index),
          textStyle: bodyLarge);

  TemplateImageContainer _displayLocationTemplatePhoto(
    BuildContext context,
    double screenWidth,
  ) =>
      TemplateImageContainer(
        height: 50,
        width: screenWidth * 0.38,
        borderRadius: _appVisualConstants.borderRadiusSmallCircular,
        asset: findLocationTemplatePhoto,
      );

  // METHODS ===========================================================================================================
  void _updateLocationTemplate(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
    LocationTemplateDynamicByUserState templateState,
    int index,
  ) {
    _assignClickedLocationTemplateAsChosenLocationTemplate(
        context, templateState, index);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return LocationTemplateUpdatingPopUp(
              locationTemplateDynamicByUserBloc:
                  locationTemplateDynamicByUserBloc);
        });
  }

  void _deleteLocationTemplate(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
    LocationTemplateDynamicByUserState templateState,
    int index,
  ) {
    _assignClickedLocationTemplateAsChosenLocationTemplate(
        context, templateState, index);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return LocationTemplateDeletingPopUp(
              locationTemplateDynamicByUserBloc:
                  locationTemplateDynamicByUserBloc);
        });
  }

  void _assignClickedLocationTemplateAsChosenLocationTemplate(
    BuildContext context,
    LocationTemplateDynamicByUserState templateState,
    int index,
  ) =>
      BlocProvider.of<
                  ChosenLocationTemplateAmongLocationTemplateDynamicOfUserOnUpdatingPopUpCubit>(
              context)
          .pressLocationTemplate(
              templateState.locationTemplateDynamicList.elementAt(index));

  // Find Method -------------------------------------------------------------------------------------------------------
  String get findLocationTemplatePhoto =>
      'assets/images/others/location_mark3.jpg';

  String _findLocationTemplateName(
    LocationTemplateDynamicByUserState templateState,
    int index,
  ) =>
      templateState.locationTemplateDynamicList
          .elementAt(index)
          .locationTemplateName;

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (context.read<LocationTemplateDynamicByUserBloc>().state.hasReachedMax ==
        false) {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          context.read<LocationTemplateDynamicByUserBloc>().add(
              LoadLocationTemplateDynamicByUserEvent(
                  uId: AppNumberConstants().appUserId,
                  offset: context
                      .read<LocationTemplateDynamicByUserBloc>()
                      .state
                      .locationTemplateDynamicList
                      .length));
        }
      }
    }
  }
}
