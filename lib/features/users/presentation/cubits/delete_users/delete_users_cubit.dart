// cubits/delete_user_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sites_management/features/users/domain/usecases/delete_user_use_case.dart';

import '../../../../../core/databases/api/end_points.dart';
import '../../../../../core/utils/services/service_locator.dart';
part 'delete_users_state.dart';
part 'delete_users_cubit.freezed.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  final DeleteUserUseCase _deleteUserUseCase;
  DeleteUserCubit()
      : _deleteUserUseCase = getIt(),
        super(const DeleteUserState.initial());

  void deleteUser(String userId) async {
    emit(const DeleteUserState.inProgress());
    final Map<String, dynamic> body = {
      RequestKeys.ids: [userId],
    };
    final response = await _deleteUserUseCase.call(body: body);
    response.fold(
      (failure) => emit(DeleteUserState.error(failure.errMessage)),
      (deleteUserEntity) => emit(const DeleteUserState.success("User Deleted")),
    );
  }
}
