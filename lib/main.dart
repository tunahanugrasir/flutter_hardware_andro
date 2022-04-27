import 'package:flutter/material.dart';
import '202/cache/shared_cache_learn.dart';

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
            appBarTheme: const AppBarTheme(elevation: 0, backgroundColor: Colors.transparent),
            progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.amber),
            bottomAppBarTheme: BottomAppBarTheme(
              shape: const CircularNotchedRectangle(),
              color: Colors.grey[850],
            ),
            listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero)),
        home: const SharedCacheLearn());
  }
}
