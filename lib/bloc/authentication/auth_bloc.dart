import 'package:bloc/bloc.dart';
import 'package:lets_talk/bloc/authentication/auth_event.dart';
import 'package:lets_talk/bloc/authentication/auth_state.dart';
import 'package:lets_talk/data/di/di.dart';
import 'package:lets_talk/data/repository/authentication_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository repository = locator.get();
  AuthBloc() : super(AuthInitialState()) {
    //----------
    //for Login
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      var response = await repository.login(
          event.phone, event.password, event.timezone, event.mac);
      emit(AuthLoginResponseState(loginResponse: response));
    });

    //----------
    //for register
    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthLoadingState());
      var response = await repository.register(
          event.username,
          event.phone,
          event.password,
          event.nationality,
          event.gender,
          event.timezone,
          event.mac);
      emit(AuthRegisterResponseState(registerResponse: response));
    });

    //----------
    //for chooseLevel
    on<AuthChooseLevelEvent>((event, emit) async {
      emit(AuthLoadingState());
      var response = await repository.chooseLevel(event.level);
      emit(AuthChooseLevelResponseState(chooseLevelResponse: response));
    });
  }
}
