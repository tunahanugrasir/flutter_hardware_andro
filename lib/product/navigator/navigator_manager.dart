import 'package:flutter/widgets.dart';
import 'package:flutter_hardware_andro/product/navigator/navigator_routes.dart';

class NavigatorManager {
  NavigatorManager._();
  static NavigatorManager instance = NavigatorManager._();
  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();
  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  void pushToPage(NavigateRoutes route) {
    _navigatorGlobalKey.currentState?.pushNamed(route.withParagf);
  }
}
