part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => <Object>[];
}

class SignInRequired extends SignInEvent {
  const SignInRequired(this.email, this.password);
  final String email;
  final String password;
}

class SignOutRequired extends SignInEvent {
  const SignOutRequired();
}
