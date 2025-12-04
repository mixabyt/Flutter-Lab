import 'package:flutter/services.dart';

class Nativemehodservice {
  static const MethodChannel _channel = MethodChannel('com.example/native_code');

  static Future<String?> randomString() async {
    final String? randomString = await _channel.invokeMethod('getNativeData');
    return randomString;
  }
}