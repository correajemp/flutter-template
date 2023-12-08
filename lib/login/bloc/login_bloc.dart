import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;
  final _flutterSecureStorage = const FlutterSecureStorage();

  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(LoginInitial()) {
    on<LoginRequest>(_onLoginRequest);
  }

  Future<void> _onLoginRequest(event, emit) async {
    try {
      emit(LoginLoading());

      final bodyForm = {
        'mobile_number': '+63${event.mobileNumber}',
        'password': event.password,
      };

      final loginResponse = await _authenticationRepository.login(
        bodyForm: bodyForm,
      );

      if (loginResponse.token != null) {
        await _flutterSecureStorage.write(
          key: 'token',
          value: loginResponse.token,
        );

        emit(const LoginSuccess());
        return;
      }
    } catch (exception) {
      emit(LoginError(exception.toString()));
    }
  }
}
