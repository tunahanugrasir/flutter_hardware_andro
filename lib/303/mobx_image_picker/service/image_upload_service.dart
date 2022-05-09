import 'dart:typed_data';

import 'package:dio/dio.dart';

class ImageUploadService {
  final Dio dio;

  ImageUploadService(this.dio);

  void uploadImage(Uint8List byteArray, String name) {
    // ignore: unused_local_variable
    var formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(byteArray),
    });

    dio.post('path', data: byteArray, onSendProgress: (int sent, int total) {});
  }
}
