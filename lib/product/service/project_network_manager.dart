import 'package:dio/dio.dart';

class ProjectNetworkManagerMixin {
  final service = Dio(BaseOptions(baseUrl: 'https://reqres.in/api')); 
}
