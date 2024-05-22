import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required this.userRepository}) : super(const AuthenticationState.unknown()) {
    _userSubscription = userRepository.user.listen((User? user) {
      add(AuthenticationUserChanged(user));
    });
    on<AuthenticationUserChanged>((AuthenticationUserChanged event, Emitter<AuthenticationState> emit) {
      if (event.user != null) {
        emit(AuthenticationState.authenticated(event.user!));
      } else {
        emit(const AuthenticationState.unauthenticated());
      }
    });
  }
  final UserRepository userRepository;
  late final StreamSubscription<User?> _userSubscription;
  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
