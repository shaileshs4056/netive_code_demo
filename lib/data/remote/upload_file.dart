import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../generated/l10n.dart';

class UploadFile {
  late bool success;
  late String message;
  late bool isUploaded;

  Future<void> call(String url, File image) async {
    try {
      final response =
          await http.put(Uri.parse(url), body: image.readAsBytesSync());
      if (response.statusCode == 200) {
        isUploaded = true;
        debugPrint(response.body);
      }
    } catch (e) {
      throw Exception(S.current.errorUploadingPhoto);
    }
  }
}
