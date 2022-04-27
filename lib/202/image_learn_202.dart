import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({Key? key}) : super(key: key);

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImagePaths.image_nike3.toWidget(height: 500),
    );
  }
}

enum ImagePaths {
  // ignore: constant_identifier_names
  image_nike3
}

extension ImagePathsExtension on ImagePaths {
  String path() {
    return 'assets/png/$name.webp';
  }

  Widget toWidget({double height = 700}) {
    return Image.asset(
      path(),
      height: height,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}
