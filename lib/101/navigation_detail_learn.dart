import 'package:flutter/material.dart';

class NavigationDetailLearn extends StatefulWidget {
  const NavigationDetailLearn({Key? key, this.isOK = false}) : super(key: key);
  final bool isOK;
  @override
  State<NavigationDetailLearn> createState() => _NavigationDetailLearnState();
}

//! peki bu sayfadan geriye nasıl haber vericezzzz?
class _NavigationDetailLearnState extends State<NavigationDetailLearn> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ModalRoute.of(context).settings.arguments
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton.icon(
            label: widget.isOK ? const Text('Reddet') : const Text('Onayla'),
            icon: const Icon(Icons.check),
            onPressed: () {
              //! isOK ne ise tam tersini yolluyoruz
              Navigator.of(context).pop(!widget.isOK);
            },
          ),
        ));
  }
}
