import 'package:flutter_hardware_andro/303/reqres_resources/model/resources_model.dart';

import '../service/reqres_service.dart';

class ReqresProvider{
  final IReqresService reqresService;
  List<Data> resources = [];

  ReqresProvider(this.reqresService){
    _fetch();
  }



  Future<void> _fetch() async {
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
  }
}