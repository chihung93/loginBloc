import 'package:flutter/material.dart';
import 'package:flutter_app/authentication/AuthenticationBloc.dart';
import 'package:flutter_app/authentication/AuthenticationEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Center(
            child: RaisedButton(
          child: Text('logout'),
          onPressed: () {
            authenticationBloc.dispatch(LoggedOut());
          },
        )),
      ),
    );
  }
}
