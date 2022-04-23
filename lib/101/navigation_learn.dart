import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/101/navigation_detail_learn.dart';

//gidip geldiğinde rengi değişen placeholder
class NavigationLearn extends StatefulWidget {
  const NavigationLearn({Key? key}) : super(key: key);

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> with NavigatorManager {
  List<int> selectedItems = [];

  void addSelected(int index, bool isAdd) {
    setState(() {
      isAdd ? selectedItems.add(index) : selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {},
          child: const Icon(Icons.navigation_outlined),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: ((context, index) {
              return TextButton(
                onPressed: () async {
                  final response = await navigateToWidgetNormal<bool>(
                      context,
                      NavigationDetailLearn(
                        isOK: selectedItems.contains(index),
                      ));
                  //! sayfadan geri gelince bunu yollamıyoruz bir şeye bağlı olarak bir reaksiyon sonucu alıyoruz
                  //! bu true değerini burada yakaladık önemli nokta bu.
                  //! burada yakalayarak ekranımıza haber verdik
                  if (response is bool) {
                    addSelected(index,response);
                  }
                },
                child: Placeholder(
                  color: selectedItems.contains(index) ? Colors.amber : Colors.lime,
                ),
              );
            })));
  }
}

mixin NavigatorManager {
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: ((context) {
        return widget;
      }),
      fullscreenDialog: true,
    ));
//! yan sayfadan sana bir data gelebilir ve sen bunu yakalayabilirsin
  }

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(MaterialPageRoute(
        builder: ((context) {
          return widget;
        }),
        fullscreenDialog: true,
        settings: const RouteSettings()));
  }
}
