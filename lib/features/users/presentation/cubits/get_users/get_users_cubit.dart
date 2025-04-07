// cubits/users_cubit.dart
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sites_management/features/users/data/service/users_event_bus.dart';
import 'package:sites_management/features/users/domain/entities/get_users_entities/get_users_entity.dart';
import 'package:sites_management/features/users/domain/usecases/fetch_users_use_case.dart';

import '../../../../../core/utils/services/service_locator.dart';

part 'get_users_state.dart';
part 'get_users_cubit.freezed.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  final GetUsersUseCase getUsersUseCase;
  final UsersEventBus eventBus;
  StreamSubscription? _usersSubscription;

  GetUsersCubit()
      : getUsersUseCase = getIt(),
        eventBus = getIt(),
        super(const GetUsersState.initial()) {
    _listenToEvents();
  }

  void _listenToEvents() {
    _usersSubscription = eventBus.events.listen((event) {
      switch (state) {
        case GetUsersLoaded(getUserEntity: var currentUsersEntity):
          final List<UserEntity> updatedItems = List.from(currentUsersEntity.users);
          switch (event) {
            case UserAddedEvent():
              updatedItems.add(event.user);
            case UserUpdatedEvent():
              updatedItems[updatedItems.indexWhere((user) => user.id == event.user.id)] = event.user;
            case UsersDeletedEvent():
              updatedItems.removeWhere((user) => event.usersIds.contains(user.id.toString()));
          }
          final GetUsersEntity updatedUsersEntity = currentUsersEntity.copyWith(users: updatedItems);
          emit(GetUsersState.loaded(updatedUsersEntity));
        case _:
      }
    });
  }

  Future<void> loadUsers() async {
    emit(const GetUsersState.loading());
    final users = await getUsersUseCase.call();
    emit(
      users.fold(
        (failure) => GetUsersState.error(failure.errMessage),
        (getUsersEntity) => GetUsersState.loaded(getUsersEntity),
      ),
    );
  }

  @override
  Future<void> close() {
    _usersSubscription!.cancel();
    return super.close();
  }
}
