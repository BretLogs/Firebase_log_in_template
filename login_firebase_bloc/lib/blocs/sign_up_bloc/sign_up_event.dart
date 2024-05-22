part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => <Object>[];
}

class SignUpRequired extends SignUpEvent {
  const SignUpRequired(this.user, this.password);
  final MyUser user;
  final String password;
}
