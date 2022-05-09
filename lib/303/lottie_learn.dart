import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/product/constants/duration_items.dart';
import 'package:flutter_hardware_andro/product/constants/lottie_items.dart';
import 'package:flutter_hardware_andro/product/extension/global/theme_notifier.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({Key? key}) : super(key: key);

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isLight = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: DurationItems.durationNormal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: (() {
              _controller.animateTo(isLight ? 0.5 : 1);
              context.read<ThemeNotifier>().changeTheme();
              isLight = !isLight;
            }),
            child: Lottie.asset(LottieItems.themeChange.lottiePath, controller: _controller, repeat: false),
          )
        ],
      ),
      body: const _LottieLoading(),
    );
  }
}

class _LottieLoading extends StatelessWidget {
  const _LottieLoading({
    Key? key,
  }) : super(key: key);
  // final _lottieData = 'https://assets2.lottiefiles.com/packages/lf20_ydo1amjm.json';
  final _lottieCatData = 'https://assets1.lottiefiles.com/packages/lf20_Zz37yH.json';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(_lottieCatData),
    );
  }
}
