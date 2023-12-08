import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthenticationRepository _authenticationRepository;
  final _flutterSecureStorage = const FlutterSecureStorage();

  RegisterBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(RegisterInitial()) {
    on<RegisterRequest>(_onRegisterRequest);
  }

  Future<void> _onRegisterRequest(event, emit) async {
    try {
      emit(RegisterLoading());

      final bodyForm = {
        'face_url': event.photoUrl,
        'mobile_number': '+63${event.mobileNumber}',
        'name': event.fullName,
        'password': event.password,
        'password_confirmation': event.confirmPassword,
      };

      final registerResponse = await _authenticationRepository.register(
        bodyForm: bodyForm,
      );

      if (registerResponse.token != null) {
        await _flutterSecureStorage.write(
          key: 'token',
          value: registerResponse.token,
        );

        emit(const RegisterSuccess());
        return;
      }
    } catch (exception) {
      emit(RegisterError(exception.toString()));
    }
  }
}
