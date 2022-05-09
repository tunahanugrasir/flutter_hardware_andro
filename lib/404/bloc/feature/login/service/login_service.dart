import 'package:flutter_hardware_andro/404/bloc/feature/login/model/login_model.dart';
import 'package:flutter_hardware_andro/product/model/token_model.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {
  final INetworkManager networkManager;

  ILoginService(this.networkManager);

  Future<IResponseModel<TokenModel?>?> login(LoginModel model);

  final _loginPatth = 'api/login';
}

class LoginService extends ILoginService {
  LoginService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<IResponseModel<TokenModel?>?> login(LoginModel model) async {
    return await networkManager.send<TokenModel, TokenModel>('api/login',
        parseModel: TokenModel(), method: RequestType.POST, data: model);
  }
}
