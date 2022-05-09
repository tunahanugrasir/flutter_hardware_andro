// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:flutter_hardware_andro/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_hardware_andro/product/model/token_model.dart';

class LoginState extends Equatable {
  const LoginState({this.isLoading = false, this.loginModel, this.tokenModel, this.isCompleted = false});

  final bool isLoading;
  final LoginModel? loginModel;
  final TokenModel? tokenModel;
  final bool isCompleted;
  @override
  List<Object?> get props => [isLoading, loginModel];

  LoginState copyWith({
    bool? isLoading,
    LoginModel? loginModel,
    TokenModel? tokenModel,
    bool? isCompleted,
  }) {
    return LoginState(
      isLoading: isLoading ?? false,
      loginModel: loginModel ?? this.loginModel,
      tokenModel: tokenModel ?? this.tokenModel,
      isCompleted: isCompleted ?? false,
    );
  }
}
