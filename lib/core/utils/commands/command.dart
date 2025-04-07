// Command pattern implemented using Cubit
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../databases/errors/failure.dart';

// Result class for command outcomes

// Command states
abstract class CommandState<T> extends Equatable {
  @override
  List<Object?> get props => [];
}

class CommandInitial<T> extends CommandState<T> {}

class CommandLoading<T> extends CommandState<T> {}

class CommandSuccess<T> extends CommandState<T> {
  final T? data;

  CommandSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class CommandFailure<T> extends CommandState<T> {
  final String error;

  CommandFailure(this.error);

  @override
  List<Object?> get props => [error];
}

// Base Command class
abstract class Command<T> extends Cubit<CommandState<T>> {
  Command() : super(CommandInitial<T>());

  bool get running => state is CommandLoading;
  bool get hasError => state is CommandFailure;
  bool get isCompleted => state is CommandSuccess;

  T? get data => state is CommandSuccess ? (state as CommandSuccess).data : null;
  String? get error => state is CommandFailure ? (state as CommandFailure).error : null;

  void clearResult() {
    emit(CommandInitial<T>());
  }

  Future<void> _execute(Future<Either<Failure, T>> Function() action) async {
    if (running) return;

    emit(CommandLoading<T>());

    try {
      final result = await action();
      result.fold((error) {
        emit(CommandFailure<T>(error.errMessage));
      }, (data) {
        emit(CommandSuccess<T>(data));
      });
    } catch (e) {
      log(e.toString());
      emit(CommandFailure<T>(e.toString()));
    }
  }
}

// Command without parameters
class Command0<T> extends Command<T> {
  final Future<Either<Failure, T>> Function() _action;

  Command0(this._action);

  Future<void> execute() async {
    await _execute(_action);
  }
}

// Command with one parameter
class Command1<T, A> extends Command<T> {
  final Future<Either<Failure, T>> Function(A) _action;

  Command1(this._action);

  Future<void> execute(A argument) async {
    await _execute(() => _action(argument));
  }
}

// Command2 that takes two arguments
class Command2<T, A, B> extends Command {
  final Future<Either<Failure, T>> Function(A, B) _action;

  Command2(this._action);

  Future<void> execute(A argumentA, B argumentB) async {
    return await _execute(() => _action(argumentA, argumentB));
  }
}

// Command3 that takes three arguments
class Command3<T, A, B, C> extends Command {
  final Future<Either<Failure, T>> Function(A, B, C) _action;

  Command3(this._action);

  Future<void> execute(A argumentA, B argumentB, C argumentC) async {
    return await _execute(() => _action(argumentA, argumentB, argumentC));
  }
}
