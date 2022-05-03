import 'package:flutter/widgets.dart';
import 'package:flutter_hardware_andro/303/reqres_resources/model/resources_model.dart';
import 'package:flutter_hardware_andro/product/extension/global/resource_context.dart';

import '../service/reqres_service.dart';

class ReqresProvider extends ChangeNotifier {
  final IReqresService reqresService;
  List<Data> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ReqresProvider(this.reqresService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(ResourceContext resourceContext) {
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}
