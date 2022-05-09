import 'package:flutter_hardware_andro/303/lottie_learn.dart';
import 'package:flutter_hardware_andro/303/navigator/navigate_home_view.dart';

import '../../303/navigator/navigate_home_detail.dart';

class NavigatorRoutes {
  static const _paragh = '/';
  final items = {
    _paragh: (context) => const LottieLearn(),
    NavigateRoutes.homeDetail.withParagf: (context) => const NavigateHomeView(),
    NavigateRoutes.profile.withParagf: (context) => const NavigateHomeDetailView(),
  };
}

enum NavigateRoutes { homeDetail, profile }

extension NavigateRoutesExtension on NavigateRoutes {
  String get withParagf => '/$name';
}
