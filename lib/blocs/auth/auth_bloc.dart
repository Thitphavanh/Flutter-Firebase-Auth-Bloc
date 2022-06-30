// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

import 'package:flutter_firebase_auth_bloc/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final StreamSubscription authSubscription;
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(AuthState.unknown()) {
    authSubscription = authRepository.user.listen((fbAuth.User? user) {
      add(AuthenStateChangedEvent(user: user));
    });
    on<AuthenStateChangedEvent>((event, emit) {
      if (event.user != null) {
        emit(
          state.copyWith(
            authenStatus: AuthenStatus.authenticated,
            user: event.user,
          ),
        );
      } else {
        emit(
          state.copyWith(
            authenStatus: AuthenStatus.unauthenticated,
            user: null,
          ),
        );
      }
    });
    on<SignoutRequestedEvent>((event, emit) async {
      await authRepository.signout();
    });
  }
}
