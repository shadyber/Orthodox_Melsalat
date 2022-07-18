import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
class CounterStorage {

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

static  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  static Future<String?> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return '';
    }
  }

  static Future<File> writeCounter(String data) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$data');
  }
}