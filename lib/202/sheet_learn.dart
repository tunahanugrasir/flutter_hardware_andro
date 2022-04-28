import 'package:flutter/material.dart';
import 'package:flutter_hardware_andro/core/random_image.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({Key? key}) : super(key: key);

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              backgroundColor: Colors.lime,
              context: context,
              builder: (context) {
                return SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 30,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Positioned(
                                  right: 0,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.close, size: 25),
                                      ))),
                              Divider(
                                thickness: 3,
                                indent: MediaQuery.of(context).size.width * 0.40,
                                endIndent: MediaQuery.of(context).size.width * 0.40,
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Expanded(flex: 1, child: Text('data')),
                      const Expanded(flex: 10, child: RandomImage())
                    ],
                  ),
                );
              });
        },
        child: const Icon(Icons.share),
      ),
      body: Column(),
    );
  }
}
