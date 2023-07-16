import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/widgets/widget.dart';

class LocationChoicePopUpUseCurrentLocationArea extends StatelessWidget {
  final LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc;

  const LocationChoicePopUpUseCurrentLocationArea(
      {required this.locationTemplateDynamicByUserBloc, super.key});

  @override
  Widget build(BuildContext context) {
    return _createLocationChoiceColumArea(
        context, locationTemplateDynamicByUserBloc);
  }

  // LOCATION CHOICE COLUM AREA ========================================================================================
  // CREATE ============================================================================================================
  CustomColumn _createLocationChoiceColumArea(
    BuildContext context,
    LocationTemplateDynamicByUserBloc locationTemplateDynamicByUserBloc,
  ) =>
      CustomColumn(
        children: [
          _displayUseCurrentLocationButton(),
        ],
      );

  // USE CURRENT LOCATION BUTTON =======================================================================================
  // DISPLAY ===========================================================================================================
  LocationChoiceButton _displayUseCurrentLocationButton() =>
      LocationChoiceButton(
        isFirst: true,
        locationName: 'Use current location',
        onTap: () {
          ///? The geolocator will be added here, to get user's current location
          if (kDebugMode) {
            print(
                "Use current location button has been clicked!!! and the geolocator will be added here, to get user's current location");
          }
        },
      );
}
