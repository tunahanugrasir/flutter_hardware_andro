import 'dart:io';

import 'package:flutter_hardware_andro/202/custom_exception.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);
  void toShare(String path) async {
    await launchUrlString(path);
  }
}

class FileDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    // ignore: avoid_print
    print('geçti');
    return true;
  }

  @override
  void toShare(String path) {
    throw UnimplementedError();
  }

  void smsShare() {}
}

class FileDownload2 extends IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    throw UnimplementedError();
  }

  void smsShare() {}
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}
