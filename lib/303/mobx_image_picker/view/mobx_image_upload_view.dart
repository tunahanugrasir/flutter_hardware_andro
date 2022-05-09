import 'package:flutter/material.dart';

class MobxImageUpload extends StatefulWidget {
  const MobxImageUpload({Key? key}) : super(key: key);

  @override
  State<MobxImageUpload> createState() => _MobxImageUploadState();
}

class _MobxImageUploadState extends State<MobxImageUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Card(
                child: FittedBox(child: IconButton(onPressed: () {}, icon: const Icon(Icons.cloud_upload_outlined))),
              )),
          const Divider(),
          const Spacer(flex: 6)
        ],
      ),
    );
  }
}
