import 'package:flutter_hardware_andro/303/reqres_resources/model/resources_model.dart';

class ResourceContext {
  ResourceModel? model;

  void saveModel(ResourceModel model) {
    this.model = model;
  }

  void clearData() {
    model = null;
  }
}
