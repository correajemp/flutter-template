part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginRequest extends LoginEvent {
  final String mobileNumber;
  final String password;

  const LoginRequest({
    required this.mobileNumber,
    required this.password,
  });

  @override
  List<Object> get props => [];
}
