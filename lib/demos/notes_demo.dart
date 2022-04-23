import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotesDemo extends StatelessWidget {
  const NotesDemo({Key? key}) : super(key: key);
  final _title = 'Create your first note';
  final _description = 'Add a note';
  final _buttonText = 'Create a note';
  final _importNotes = 'Import notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding + PaddingItems.verticalPadding,
        child: Column(
          children: [
            const PngImage(name: ImageItems.bookImage),
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubtitleWidget(title: _description * 10),
            ),
            const Spacer(),
            _createButton(context),
            TextButton(onPressed: () {}, child: Text(_importNotes))
          ],
        ),
      ),
    );
  }

  ElevatedButton _createButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: SizedBox(
          height: ButtonHeights.buttonNormalHeight,
          child: Center(
              child: Text(_buttonText,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white))),
        ));
  }
}

class ButtonHeights {
  static const double buttonNormalHeight = 50;
}

class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget({
    Key? key,
    this.textAlign = TextAlign.center,
    required this.title,
  }) : super(key: key);

  final TextAlign textAlign;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(fontWeight: FontWeight.w400, color: Colors.black),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}

class PaddingItems {
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);
}

class ImageItems {
  static const String bookImage = "book_image";
}

class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/png/$name.png',
      fit: BoxFit.cover,
    );
  }
}
