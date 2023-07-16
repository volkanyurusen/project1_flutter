import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/repositories/repositories.dart';

part 'process_detail_dynamic_event.dart';
part 'process_detail_dynamic_state.dart';

class ProcessDetailDynamicBloc
    extends Bloc<ProcessDetailDynamicEvent, ProcessDetailDynamicState> {
  final Repositories _repositories = Repositories();
  //
  // final ProcessDetailDynamicRepository _processDetailDynamicRepository =
  //     ProcessDetailDynamicRepository();

  ProcessDetailDynamicBloc()
      : super(const ProcessDetailDynamicState(status: Status.initial)) {
    on<LoadProcessDetailDynamicEvent>(onLoadProcessDetailDynamic);
  }

  FutureOr<void> onLoadProcessDetailDynamic(
      event, Emitter<ProcessDetailDynamicState> emit) async {
    emit(const ProcessDetailDynamicState(status: Status.loading));

    try {
      final allProcessDetailDynamicResponses =
          await _repositories.getAllProcessDetailDynamicData();
      //
      // await _processDetailDynamicRepository.getProcessDetailDynamics();
      //
      // if (kDebugMode) {
      //   print('allProcessDetailDynamicResponses: $allProcessDetailDynamicResponses');
      // }
      emit(state.copyWith(
          status: Status.success,
          processDetailDynamicList: allProcessDetailDynamicResponses));
    } catch (e) {
      ProcessDetailDynamicState(status: Status.failure, error: e.toString());
    }
  }
}
