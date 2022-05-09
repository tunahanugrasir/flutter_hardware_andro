import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hardware_andro/202/image_learn_202.dart';
import 'package:flutter_hardware_andro/404/bloc/feature/login/cubit/login_cubit.dart';
import 'package:flutter_hardware_andro/404/bloc/feature/login/service/login_service.dart';
import 'package:kartal/kartal.dart';

import '../cubit/login_cubit_state.dart';
import '../service/vexana_network_manager.dart';

part './login_view.g.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formLoginKey = GlobalKey();
  final String _loginText = 'Login';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(LoginService(VexanaNetworkManager())),
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formLoginKey,
          child: Padding(
            padding: context.paddingNormal,
            child: Column(
              children: [
                _LoginAndPasswordWidgets(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                _LoginButton(
                  loginText: _loginText,
                  formLoginKey: _formLoginKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
  const PagePadding.bottom() : super.only(bottom: 20);
}
