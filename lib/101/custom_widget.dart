import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget with _ColorsUtility {
  CustomWidgetLearn({Key? key}) : super(key: key);
  final String _buttonTitle = 'Food';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(width: MediaQuery.of(context).size.width,child: CustomFoodButton(title: _buttonTitle,onPressed: (){},)),
          )),
          CustomFoodButton(title: _buttonTitle,onPressed: (){},),
        ],
      ),
    );
  }
}

class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8);
  final EdgeInsets normal2xPadding = const EdgeInsets.all(16);
}

class CustomFoodButton extends StatelessWidget with _ColorsUtility {
  CustomFoodButton({Key? key, required this.title,required this.onPressed}) : super(key: key);
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: redColor, shape: const StadiumBorder()),
        onPressed: onPressed,
        child: Padding(
          padding: _PaddingUtility().normalPadding,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: whiteColor, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
