// cubits/user_form_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sites_management/core/databases/api/end_points.dart';
import 'package:sites_management/core/helper/extensions.dart';
import 'package:sites_management/features/users/domain/entities/get_users_entities/get_users_entity.dart';
import 'package:sites_management/features/users/domain/usecases/add_user_use_case.dart';
// import 'package:sites_management/features/users/presentation/cubits/update_add_users/update_add_users_state.dart';

import '../../../../../core/shared/enums/user_role.dart';
import '../../../../../core/utils/services/service_locator.dart';
import '../../../domain/usecases/edit_user_use_case.dart';

part 'update_add_users_cubit.freezed.dart';
part 'update_add_users_state.dart';

class UpdateAddUserCubit extends Cubit<UpdateAddUserState> {
  final AddUserUseCase addUserUseCase;
  final EditUserUseCase editUserUseCase;

  TextEditingController addUserUsernameController = TextEditingController();
  TextEditingController addUserPasswordController = TextEditingController();
  TextEditingController updateUserUsernameController = TextEditingController();
  TextEditingController updateUserPasswordController = TextEditingController();
  final addUserFormKey = GlobalKey<FormState>();
  final editUserFormKey = GlobalKey<FormState>();
  UserRole addUserSelectedRole = UserRole.WORKER;
  UserRole updateUserSelectedRole = UserRole.WORKER;
  bool isVisible = false;

  UpdateAddUserCubit()
      : addUserUseCase = getIt(),
        editUserUseCase = getIt(),
        super(const UpdateAddUserState.initial());

  void changeVisiblity() {
    isVisible = !isVisible;
    emit(state.copyWith(dummy: !state.dummy));
  }

  void initUpdateControllers(UserEntity user) {
    updateUserUsernameController.text = user.username ?? "Unknown";
    // updateUserPasswordController.text = user.pa;
    updateUserSelectedRole = UserRole.roleFromString(user.role!);
    emit(state.copyWith(dummy: !state.dummy));
  }

  void selectAddUserRole(UserRole role) {
    addUserSelectedRole = role;
    emit(state.copyWith(dummy: !state.dummy));
  }

  void selectUpdateUserRole(UserRole role) {
    updateUserSelectedRole = role;
    emit(state.copyWith(dummy: !state.dummy));
  }

  void addUser() async {
    emit(const UpdateAddUserState.submitting());

    Map<String, dynamic> body = {
      RequestKeys.username: addUserUsernameController.text,
      RequestKeys.password: addUserPasswordController.text,
      RequestKeys.role: addUserSelectedRole.userRoleName,
    };
    final response = await addUserUseCase.call(body: body);
    response.fold(
      (failure) => emit(UpdateAddUserState.error(message: failure.errMessage)),
      (addUserEntity) => emit(const UpdateAddUserState.success(message: "User Added")),
    );
  }

  void updateUser() async {
    emit(const UpdateAddUserState.submitting());

    Map<String, dynamic> body = {
      RequestKeys.username: updateUserUsernameController.text,
      RequestKeys.password: updateUserPasswordController.text,
      RequestKeys.role: updateUserSelectedRole.userRoleName,
    };
    final response = await editUserUseCase.call(body: body);
    response.fold(
      (failure) => emit(UpdateAddUserState.error(message: failure.errMessage)),
      (addUserEntity) => emit(const UpdateAddUserState.success(message: "User Updated")),
    );
  }
}
