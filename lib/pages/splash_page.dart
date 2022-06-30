import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_bloc/blocs/auth/auth_bloc.dart';
import 'package:flutter_firebase_auth_bloc/pages/home_page.dart';
import 'package:flutter_firebase_auth_bloc/pages/signin_page.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = '/';
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        print('listen: $state');
        if (state.authenStatus == AuthenStatus.unauthenticated) {
          Navigator.pushNamed(context, SigninPage.routeName);
        } else if (state.authenStatus == AuthenStatus.authenticated) {
          Navigator.pushNamed(context, HomePage.routeName);
        }
      },
      builder: (context, state) {
        print('builder: $state');
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
