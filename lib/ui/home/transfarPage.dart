import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../router/app_router.dart';

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

  Future<void> _sendTextToNative(String text) async {
    try {
      await platform.invokeMethod('navigateToNative', {"data": text});
    } on PlatformException catch (e) {
      debugPrint("Failed to invoke native method: '${e.message}'.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Transfer "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Enter text',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextButton(

                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    print('Entered text: ${_textController.text}');
                    _sendTextToNative(_textController.text);
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
