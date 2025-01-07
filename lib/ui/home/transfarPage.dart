import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class TransfarPage extends StatefulWidget {
  const TransfarPage({super.key});

  @override
  State<TransfarPage> createState() => _TransfarpageState();
}

class _TransfarpageState extends State<TransfarPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();

  static const platform = MethodChannel('com.example.myapp/navigation');


  Future<void> navigateToNative() async {
    try {
      await platform.invokeMethod('openNativeScreen');
    } on PlatformException catch (e) {
      print("Error navigating to native screen: ${e.message}");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Transfer"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    print('Entered text: ${_textController.text="hello"}');
                    navigateToNative(); // Navigate to native screen
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text('Go To Native'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
