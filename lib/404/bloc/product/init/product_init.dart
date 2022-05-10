import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hardware_andro/404/bloc/product/init/localization_init.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../product/extension/global/resource_context.dart';
import '../../../../product/extension/global/theme_notifier.dart';

class ProductInit {
  final LocalizationInit localizationInit = LocalizationInit();
  final List<SingleChildWidget> providers = [
          Provider(create: (_) => ResourceContext()),
          ChangeNotifierProvider(create: (context) => ThemeNotifier()),
        ];

  Future<void> init() async {
     await EasyLocalization.ensureInitialized();
  }
}
