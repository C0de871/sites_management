part of 'get_users_cubit.dart';

@freezed
sealed class GetUsersState with _$UsersState {
  const factory GetUsersState.initial() = GetUsersInitial;
  const factory GetUsersState.loading() = GetUsersLoading;
  const factory GetUsersState.loaded(GetUsersEntity getUserEntity) = GetUsersLoaded;
  const factory GetUsersState.error(String message) = GetUsersFailed;
}
