import 'dart:async';

import '../../domain/entities/get_users_entities/get_users_entity.dart';

class UsersEventBus {
  final _controller = StreamController<UsersEvent>.broadcast();

  Stream<UsersEvent> get events => _controller.stream;

  void emit(UsersEvent event) {
    _controller.add(event);
  }

  void dispose() {
    _controller.close();
  }
}

sealed class UsersEvent {}

class UserAddedEvent extends UsersEvent {
  final UserEntity user;
  UserAddedEvent(this.user);
}

class UserUpdatedEvent extends UsersEvent {
  final UserEntity user;
  UserUpdatedEvent(this.user);
}

class UsersDeletedEvent extends UsersEvent {
  List<String> usersIds;
  UsersDeletedEvent(this.usersIds);
}
