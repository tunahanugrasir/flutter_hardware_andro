import 'package:flutter_hardware_andro/202/cache/shared_cache_learn.dart';
import 'package:flutter_hardware_andro/303/reqres_resources/model/resources_model.dart';
import 'package:flutter_hardware_andro/303/reqres_resources/service/reqres_service.dart';
import '../../../product/service/project_network_manager.dart';
import '../view/reqres_view.dart';

abstract class ReqresViewModel extends LoadingStateful<ReqresView> with ProjectNetworkManagerMixin {
  late final IReqresService reqresService;
  List<Data> resources = [];

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await reqresService.fetchResourceItem())?.data ?? [];
    changeLoading();
  }
}
