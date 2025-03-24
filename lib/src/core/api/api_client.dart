// lib/core/api/api_client.dart
import 'package:dio/dio.dart';
import 'package:evnt/src/core/api/api_endpoint.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'api_client.g.dart';

class ApiClient {
  final Dio _dio;

  ApiClient() : _dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));

  Future<List<dynamic>> getProducts() async {
    final response = await _dio.get(ApiEndpoints.products);
    return response.data['products'] ?? [];
  }

  Future<Map<String, dynamic>> getProductDetails(int id) async {
    final response = await _dio.get('${ApiEndpoints.products}/$id');
    return response.data;
  }
}

@riverpod
ApiClient apiClient(Ref ref) {
  return ApiClient();
}

