part of 'register_bloc.dart';

abstract class RegisterState {
  const RegisterState();

  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  const RegisterSuccess();

  @override
  List<Object> get props => [];
}

class RegisterError extends RegisterState {
  final String message;

  const RegisterError(this.message);

  @override
  List<Object> get props => [message];
}
