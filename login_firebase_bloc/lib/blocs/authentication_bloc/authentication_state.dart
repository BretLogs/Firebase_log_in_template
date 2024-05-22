part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unathenticated, unknown }

class AuthenticationState extends Equatable {
  const AuthenticationState.unknown() : this._();
  const AuthenticationState.authenticated(User user)
      : this._(
          status: AuthenticationStatus.authenticated,
          user: user,
        );
  const AuthenticationState.unauthenticated() : this._();
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user,
  });

  final AuthenticationStatus status;
  final User? user;

  @override
  List<Object?> get props => <Object?>[status, user];
}
