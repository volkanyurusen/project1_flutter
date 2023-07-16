import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/repositories/repositories.dart';

part 'membership_type_event.dart';
part 'membership_type_state.dart';

class MembershipTypeBloc
    extends Bloc<MembershipTypeEvent, MembershipTypeState> {
  final Repositories _repositories = Repositories();
  //
  // final MembershipTypeRepository _membershipTypeRepository =
  //     MembershipTypeRepository();

  MembershipTypeBloc()
      : super(const MembershipTypeState(status: Status.initial)) {
    on<LoadMembershipTypeEvent>(_onLoadMembershipType);
  }

  FutureOr<void> _onLoadMembershipType(
      event, Emitter<MembershipTypeState> emit) async {
    emit(const MembershipTypeState(status: Status.loading));

    try {
      final allMembershipTypeResponses =
          await _repositories.getAllMembershipTypeData();
      //
      // await _membershipTypeRepository.getMembershipTypeData();
      //
      // if (kDebugMode) {
      //   print('allMembershipTypeResponses: $allMembershipTypeResponses');
      // }
      emit(state.copyWith(
          status: Status.success,
          membershipTypeList: allMembershipTypeResponses));
    } catch (e) {
      MembershipTypeState(status: Status.failure, error: e.toString());
    }
  }
}
