import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/product/extension/global/resource_context.dart';
import 'package:flutter_hardware_andro/product/extension/global/theme_notifier.dart';
import 'package:provider/provider.dart';

import '404/bloc/feature/login/view/login_view.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MultiProvider(providers: [
      Provider(create: (_) => ResourceContext()),
      ChangeNotifierProvider(create: (context) => ThemeNotifier()),
    ], child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
