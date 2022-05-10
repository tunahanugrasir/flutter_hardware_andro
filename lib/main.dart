import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/404/bloc/product/init/product_init.dart';
import 'package:flutter_hardware_andro/product/extension/global/theme_notifier.dart';
import 'package:provider/provider.dart';
import '404/bloc/feature/login/view/login_view.dart';

Future<void> main() async {
  final _productInit = ProductInit();
  await _productInit.init();
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MultiProvider(
        providers: _productInit.providers,
        child: EasyLocalization(
            supportedLocales: _productInit.localizationInit.supportedLocales,
            path: _productInit.localizationInit.localizationPath, // <-- change the path of the translation files
            child: const MyApp())),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: context.watch<ThemeNotifier>().currentTheme,
      // routes: NavigatorRoutes().items,
      // navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
      home: const LoginView(),
    );
  }
}
