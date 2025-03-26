import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/services/service_locator.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/login_user_use_case.dart';
import '../../../domain/usecases/retreive_access_token_use_case.dart';
import '../../../domain/usecases/retreive_user_use_case.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUserUseCase loginUserUseCase;
  RetreiveAccessTokenUseCase retreiveAccessTokenUseCase;
  RetreiveUserUseCase retreiveUserUseCase;
  LoginCubit()
      : loginUserUseCase = getIt(),
        retreiveAccessTokenUseCase = getIt(),
        retreiveUserUseCase = getIt(),
        super(const LoginState.inital()) {
    log("login cubit is created");
  }
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool rememberMe = false;

  final formKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    log("isPasswordVisible: $isPasswordVisible");
    emit(state.copyWith(dummy: !state.dummy));
  }

  void toggleRememberMe() {
    rememberMe = !rememberMe;
    emit(state.copyWith());
  }

  Future<void> login() async {
    emit(const LoginState.loading());

    final result = await loginUserUseCase.call(
      body: {
        'username': usernameController.text,
        'password': passwordController.text,
      },
    );

    result.fold(
      (failure) => emit(LoginState.failure(errorMessage: failure.errMessage)),
      (user) => emit(
        LoginState.success(user: user),
      ),
    );
  }

  retrieveUser() async {
    log("retrieving user");
    final result = await retreiveUserUseCase.call();
    result.fold(
      (failure) {
        log("failure: ${failure.errMessage}");
        emit(LoginState.failure(errorMessage: failure.errMessage));
      },
      (user) {
        log("user: $user");
        emit(LoginState.success(user: user));
      },
    );
  }

  void resetState() {
    emit(const LoginState.inital());
  }

  @override
  Future<void> close() async {
    usernameController.dispose();
    passwordController.dispose();
    log("login cubit is closed");
    return super.close();
  }

  @override
  void onChange(Change<LoginState> change) {
    log("is state changed: ${change.currentState == change.nextState}");
    super.onChange(change);
  }
}
