import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/screens/profile/bodies/zbodies.dart';
import 'package:my_project/widgets/widget.dart';

class LocationChoicePopUp extends StatelessWidget {
  final AppNumberConstants _appNumberConstants = AppNumberConstants();

  LocationChoicePopUp({super.key, required});

  @override
  Widget build(BuildContext context) {
    final LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc =
        context.read<LocationTemplateDynamicByUserBloc>();

    return _createPopUp(context, locationTemplateDynamicByUserBloc);
  }

  // LOCATION CHOICE POP UP ============================================================================================
  // CREATE ============================================================================================================
  PopUpBody _createPopUp(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
  ) =>
      PopUpBody(
        height: context.height *
            _appNumberConstants.kLocationTemplateAddingDialogRatio,
        children: [
          LocationChoicePopUpTitleArea(
              locationTemplateDynamicByUserBloc:
                  locationTemplateDynamicByUserBloc),
          LocationChoicePopUpUseCurrentLocationArea(
              locationTemplateDynamicByUserBloc:
                  locationTemplateDynamicByUserBloc),
          LocationChoicePopUpLocationTemplateArea(),
        ],
      );
}
