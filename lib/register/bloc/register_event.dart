part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterRequest extends RegisterEvent {
  final String photoUrl;
  final String fullName;
  final String mobileNumber;
  final String password;
  final String confirmPassword;

  const RegisterRequest({
    required this.photoUrl,
    required this.fullName,
    required this.mobileNumber,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [];
}
