import 'package:flutter/services.dart';

class NativeApiHandler {
  static MethodChannel _channel = MethodChannel('com.example.myapp/navigation');

  static final NativeApiHandler instance = NativeApiHandler._init();
  NativeApiHandler._init();

  // Configure the MethodChannel and set the method call handler
  void configureChannel() async {
    print('configureChannel 1');

    // Set the handler to process incoming method calls
    _channel.setMethodCallHandler(this.methodHandler);
  }

  // Method handler for handling incoming calls from the native Android side
  Future<void> methodHandler(MethodCall call) async {
    print('Flutter methodHandler called with method: ${call.method}');
    switch (call.method) {
      case "makeApiCall":
        print("Flutter: Handling makeApiCall");
        await makeApiCall();  // Trigger the API call
        break;
      case "apiResponse":
        print("Flutter: Received API response: ${call.arguments}");
        break;
      case "apiError":
        print("Flutter: Error received: ${call.arguments}");
        break;
      default:
        print("Flutter: No handler for method ${call.method}");
    }
  }
  // Triggering API call from Flutter
  static Future<void> makeApiCall() async {
    print("Flutter: Calling native API...");
    try {
      // Send the makeApiCall to native Android code and await response
      final response = await _channel.invokeMethod('makeApiCall');
      print("Flutter: API Response: $response");
    } catch (e) {
      // Handle any errors that may arise
      print("Flutter: API Error: $e");
    }
  }
}
