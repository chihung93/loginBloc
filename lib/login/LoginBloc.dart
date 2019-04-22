import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/UserRepository.dart';
import 'package:flutter_app/authentication/AuthenticationBloc.dart';
import 'package:flutter_app/authentication/AuthenticationEvent.dart';
import 'package:flutter_app/login/LoginEvent.dart';
import 'package:flutter_app/login/LoginState.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({@required this.userRepository, @required this.authenticationBloc})
      : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final token = await userRepository.authentication(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.dispatch(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
