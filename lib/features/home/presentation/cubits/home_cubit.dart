import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sites_management/features/auth/domain/usecases/retreive_user_use_case.dart';

import '../../../../core/shared/enums/user_role.dart';
import '../../../../core/utils/services/service_locator.dart';

part "home_state.dart";
part "home_cubit.freezed.dart";

class HomeCubit extends Cubit<HomeState> {
  final RetreiveUserUseCase retreiveUserUseCase;
  HomeCubit()
      : retreiveUserUseCase = getIt(),
        super(const HomeState.inital());

  Future<void> retrieveUser() async {
    final result = await retreiveUserUseCase.call();
    result.fold(
      (failure) {
        log("user not found");
        emit(HomeState.failure(
          errorMessage: failure.errMessage,
        ));
      },
      (user) {
        log("user role: ${user.role}");
        emit(HomeState.success(
            role: UserRole.roleFromString(
          user.role,
        )));
      },
    );
  }
}
