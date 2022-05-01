import 'package:flutter/material.dart';
import 'demos/demo_json/view/demo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(elevation: 0, backgroundColor: Color.fromARGB(255, 86, 7, 234)),
            progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.amber),
            bottomAppBarTheme: BottomAppBarTheme(
              shape: const CircularNotchedRectangle(),
              color: Colors.grey[850],
            ),
            listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero)),
        home: const DemoView());
  }
}
