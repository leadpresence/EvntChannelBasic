import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'method_channel_service.g.dart';

class MethodChannelService {
  static const MethodChannel _channel = MethodChannel('com.example.ecommerce_app/device_info');

  Future<Map<String, dynamic>> getDeviceInfo() async {
    try {
      final Map<dynamic, dynamic> result = await _channel.invokeMethod('getDeviceInfo');
      return Map<String, dynamic>.from(result);
    } on PlatformException catch (e) {
      return {'error': e.message};
    }
  }
}

@riverpod
MethodChannelService methodChannelService(MethodChannelServiceRef ref) {
  return MethodChannelService();
}